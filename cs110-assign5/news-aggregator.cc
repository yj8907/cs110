/**
 * File: news-aggregator.cc
 * --------------------------------
 * Presents the implementation of the NewsAggregator class.
 */

#include "news-aggregator.h"
#include <iostream>
#include <iomanip>
#include <getopt.h>
#include <libxml/parser.h>
#include <libxml/catalog.h>
#include <set>
#include "../extra/include/semaphore.h"
#include <thread>

// you will almost certainly need to add more system header includes

// I'm not giving away too much detail here by leaking the #includes below,
// which contribute to the official CS110 staff solution.
#include "rss-feed.h"
#include "rss-feed-list.h"
#include "html-document.h"
#include "html-document-exception.h"
#include "rss-feed-exception.h"
#include "rss-feed-list-exception.h"
#include "utils.h"
#include "ostreamlock.h"
#include "string-utils.h"

using namespace std;

/**
 * Factory Method: createNewsAggregator
 * ------------------------------------
 * Factory method that spends most of its energy parsing the argument vector
 * to decide what rss feed list to process and whether to print lots of
 * of logging information as it does so.
 */
static const string kDefaultRSSFeedListURL = "small-feed.xml";

NewsAggregator *NewsAggregator::createNewsAggregator(int argc, char *argv[]) {
    struct option options[] = {
            {"verbose", no_argument,       NULL, 'v'},
            {"quiet",   no_argument,       NULL, 'q'},
            {"url",     required_argument, NULL, 'u'},
            {NULL, 0,                      NULL, 0},
    };

    string rssFeedListURI = kDefaultRSSFeedListURL;
    bool verbose = false;
    while (true) {
        int ch = getopt_long(argc, argv, "vqu:", options, NULL);
        if (ch == -1) break;
        switch (ch) {
            case 'v':
                verbose = true;
                break;
            case 'q':
                verbose = false;
                break;
            case 'u':
                rssFeedListURI = optarg;
                break;
            default:
                NewsAggregatorLog::printUsage("Unrecognized flag.", argv[0]);
        }
    }

    argc -= optind;
    if (argc > 0) NewsAggregatorLog::printUsage("Too many arguments.", argv[0]);
    return new NewsAggregator(rssFeedListURI, verbose);
}

/**
 * Method: buildIndex
 * ------------------
 * Initalizex the XML parser, processes all feeds, and then
 * cleans up the parser.  The lion's share of the work is passed
 * on to processAllFeeds, which you will need to implement.
 */
void NewsAggregator::buildIndex() {
    if (built) return;
    built = true; // optimistically assume it'll all work out
    xmlInitParser();
    xmlInitializeCatalog();
    processAllFeeds();
    xmlCatalogCleanup();
    xmlCleanupParser();
}

/**
 * Method: queryIndex
 * ------------------
 * Interacts with the user via a custom command line, allowing
 * the user to surface all of the news articles that contains a particular
 * search term.
 */
void NewsAggregator::queryIndex() const {
    static const size_t kMaxMatchesToShow = 15;
    while (true) {
        cout << "Enter a search term [or just hit <enter> to quit]: ";
        string response;
        getline(cin, response);
        response = trim(response);
        if (response.empty()) break;
        const vector<pair<Article, int> > &matches = index.getMatchingArticles(response);
        if (matches.empty()) {
            cout << "Ah, we didn't find the term \"" << response << "\". Try again." << endl;
        } else {
            cout << "That term appears in " << matches.size() << " article"
                 << (matches.size() == 1 ? "" : "s") << ".  ";
            if (matches.size() > kMaxMatchesToShow)
                cout << "Here are the top " << kMaxMatchesToShow << " of them:" << endl;
            else if (matches.size() > 1)
                cout << "Here they are:" << endl;
            else
                cout << "Here it is:" << endl;
            size_t count = 0;
            for (const pair<Article, int> &match: matches) {
                if (count == kMaxMatchesToShow) break;
                count++;
                string title = match.first.title;
                if (shouldTruncate(title)) title = truncate(title);
                string url = match.first.url;
                if (shouldTruncate(url)) url = truncate(url);
                string times = match.second == 1 ? "time" : "times";
                cout << "  " << setw(2) << setfill(' ') << count << ".) "
                     << "\"" << title << "\" [appears " << match.second << " " << times << "]." << endl;
                cout << "       \"" << url << "\"" << endl;
            }
        }
    }
}

/**
 * Private Constructor: NewsAggregator
 * -----------------------------------
 * Self-explanatory.  You may need to add a few lines of code to
 * initialize any additional fields you add to the private section
 * of the class definition.
 */
NewsAggregator::NewsAggregator(const string &rssFeedListURI, bool verbose) :
        log(verbose), rssFeedListURI(rssFeedListURI), built(false) {}

/**
 * Private Method: processAllFeeds
 * -------------------------------
 * Downloads and parses the encapsulated RSSFeedList, which itself
 * leads to RSSFeeds, which themsleves lead to HTMLDocuemnts, which
 * can be collectively parsed for their tokens to build a huge RSSIndex.
 * 
 * The vast majority of your Assignment 5 work has you implement this
 * method using multithreading while respecting the imposed constraints
 * outlined in the spec.
 */

static void runHTMLDownload(const string &url, vector<string> &token_intersection,
        mutex &docMutex, semaphore &htmlDocSemaphore){

    HTMLDocument htmlDoc(url);

    try {

        htmlDoc.parse();
        htmlDocSemaphore.signal();

        vector<string> tokens(htmlDoc.getTokens());
        sort(tokens.begin(), tokens.end());

        docMutex.lock();
        if (token_intersection.empty()){
            token_intersection = tokens;
        } else {
            vector<string> intersection_tmp;
            set_intersection(token_intersection.begin(), token_intersection.end(),
                             tokens.begin(), tokens.end(),
                             back_inserter(intersection_tmp));
            token_intersection.swap(intersection_tmp);
        }
        docMutex.unlock();

    } catch (HTMLDocumentException &e){
        cout << e.what() << endl;
        htmlDocSemaphore.signal();
    }

}

static void runRSSFeed(const pair<string const, string> &feed, set<string> &docUrlSet, RSSIndex &index,
                mutex &htmlSetMtx, mutex &idxMutex, mutex &serverMtx,
                semaphore &rssFeedSemaphore, semaphore &htmlDocSemaphore,
                map<string, unique_ptr<semaphore>> &serverManager){

    RSSFeed rssFeed(feed.first);
//    cout << rssFeed.getUrl() << endl;

    int kMaxServerConect = 8;
    mutex htmlMtx;
    try {
        try {
            rssFeed.parse();

            vector<Article> articles(rssFeed.getArticles());
            sort(articles.begin(), articles.end(), articleCmp);

            auto curr_iter = articles.begin();
            while(curr_iter != articles.end()){

                auto next_iter = upper_bound(curr_iter, articles.end(), *curr_iter, articleCmp);

                vector<string> token_intersection;
                vector<thread> htmlThreads;
                for (auto iter = curr_iter; iter != next_iter; ++iter){

                    htmlSetMtx.lock();
                    bool cont = docUrlSet.find(iter->url) == docUrlSet.end();
                    if (cont) docUrlSet.insert(iter->url);
                    htmlSetMtx.unlock();

                    serverMtx.lock();
                    if (serverManager.find(getURLServer(iter->url)) == serverManager.cend()){
                        semaphore *serverCounter = new semaphore(kMaxServerConect);
                        serverManager.emplace(getURLServer(iter->url), unique_ptr<semaphore>(serverCounter));
                    }

                    serverManager[getURLServer(iter->url)]->wait();
                    serverMtx.unlock();

                    if (cont){
                        htmlDocSemaphore.wait();
                        thread basic_thread(runHTMLDownload, ref(iter->url), ref(token_intersection),
                                ref(htmlMtx), ref(htmlDocSemaphore));
                        htmlThreads.push_back(move(basic_thread));
                    }
                    serverMtx.lock();
                    serverManager[getURLServer(iter->url)]->signal();
                    serverMtx.unlock();
                }

                for (thread &t : htmlThreads) t.join();

                idxMutex.lock();
                index.add(*curr_iter, token_intersection);
                idxMutex.unlock();

                curr_iter = next_iter;
            }

        } catch ( RSSFeedException &e){
            cout << e.what() << endl;
        }
    } catch (RSSFeedListException &e){
        cout << e.what() << endl;
    }
    rssFeedSemaphore.signal(on_thread_exit);

}

//static void runRSSFeed(const pair<string, string> &feed, set<string> &docUrlSet, RSSIndex &index,
//        mutex &htmlSetMtx, mutex &idxMutex, mutex &serverMtx,
//        semaphore &rssFeedSemaphore, semaphore &htmlDocSemaphore,
//        map<string, unique_ptr<semaphore>> &serverManager){}


void NewsAggregator::processAllFeeds() {

    RSSFeedList rssFeedList(rssFeedListURI);
    rssFeedList.parse();

    set<string> feedUrlSet;
    set<string> docUrlSet;

    int kMaxRssFeedThreads = 5;
    int kMaxHTMLDocument = 18;
    semaphore rssFeedSemaphore(kMaxRssFeedThreads);
    semaphore htmlDocSemaphore(kMaxHTMLDocument);
    mutex htmlSetMutext;
    mutex idxMutex;
    mutex serverMutex;
    vector<thread> rssFeedThreads;
    map<string, unique_ptr<semaphore>> serverManager;

    for (const auto &feed : rssFeedList.getFeeds()){
        if (feedUrlSet.find(feed.first) == feedUrlSet.cend()){
            feedUrlSet.insert(feed.first);
            rssFeedSemaphore.wait();
            thread basic_thread(runRSSFeed, ref(feed), ref(docUrlSet), ref(index),
                    ref(htmlSetMutext), ref(idxMutex), ref(serverMutex),
                    ref(rssFeedSemaphore), ref(htmlDocSemaphore), ref(serverManager));

            rssFeedThreads.push_back(move(basic_thread));
        }
    }

    for (thread &t : rssFeedThreads) t.join();

}

