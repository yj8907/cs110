
#include "pathname.h"
#include "directory.h"
#include "inode.h"
#include "diskimg.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

int pathname_lookup(struct unixfilesystem *fs, const char *pathname) {

    char path_sep = '/';
    if ( strncmp(pathname, &path_sep, 1) != 0) return -1;

    char path[strlen(pathname)];
    strcpy(path, pathname);
    strcat(path, "/");
    const char* path_ptr = path;
    ++path_ptr;

    const char* ptr;
    int dirinumber = 1;
    struct direntv6 dirEnt;

    while ( path_ptr != '\0' && (ptr = strchr(path_ptr, path_sep)) != NULL ){
        int dirsize = ptr - path_ptr;
        if (dirsize == 0) {
            path_ptr = ptr + 1;
            continue;
        }
        char dirname[dirsize+1];
        memset(dirname, '\0', dirsize+1);
        stpncpy(dirname, path_ptr, dirsize);

        if (directory_findname(fs, dirname, dirinumber, &dirEnt) < 0) {
            fprintf(stderr, "file %s doesn't exist", dirname);
            return -1;
        }
        dirinumber = dirEnt.d_inumber;
        path_ptr = ptr + 1;
    }

    return dirinumber;

}
