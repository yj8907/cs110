#include "directory.h"
#include "inode.h"
#include "diskimg.h"
#include "file.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>


// remove the placeholder implementation and replace with your own
int directory_findname(struct unixfilesystem *fs, const char *name,
                       int dirinumber, struct direntv6 *dirEnt) {

    if (strlen(name) > DIRNAME_MAX_SIZE) return -1;

    struct inode dir_inp;
    int err = inode_iget(fs, dirinumber, &dir_inp);
    if (err < 0) return err;
    if ( (dir_inp.i_mode & IFDIR) == 0) return -1;

    int max_blockNum = inode_getsize(&dir_inp)/DISKIMG_SECTOR_SIZE;

    max_blockNum += inode_getsize(&dir_inp) % DISKIMG_SECTOR_SIZE == 0 ? 0 : 1;

    for (int i = 0;i < max_blockNum; ++i){
        char buf[512];

        int numValidbytes = file_getblock(fs, dirinumber, i, buf);
        if (numValidbytes < 0) return -1;

        int num_dir_content = numValidbytes / DIR_PAYLOAD_SIZE;
        for (int j = 0; j < num_dir_content; ++j){
            char filebuf[DIR_PAYLOAD_SIZE];
            memcpy(filebuf, buf + j*DIR_PAYLOAD_SIZE, DIR_PAYLOAD_SIZE);

            if (strcmp(filebuf + DIR_PAYLOAD_SIZE - DIRNAME_MAX_SIZE, name) == 0){
                dirEnt->d_inumber = *(uint16_t*)(filebuf);
                strcpy(dirEnt->d_name, name);
                return 0;
            }
        }
    }

    return -1;
}
