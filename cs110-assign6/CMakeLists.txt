cmake_minimum_required(VERSION 3.15)
project(cs110-assign6)

set(CMAKE_CXX_STANDARD 14)
include_directories(../extra/include)
include_directories(/usr/local/opt/libxml2/include/libxml2/)


add_executable(cs110-assign6 html-document.cc news-aggregator.cc log.cc news-aggregator.cc
        rss-feed-list.cc rss-index.cc stream-tokenizer.cc  utils.cc
        aggregate.cc rss-feed.cc thread-pool.cc)