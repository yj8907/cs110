#include <stdio.h>
#include <assert.h>

#include "file.h"
#include "inode.h"
#include "diskimg.h"

// remove the placeholder implementation and replace with your own
int file_getblock(struct unixfilesystem *fs, int inumber, int blockNum, void *buf) {

    struct inode inp;
    int err = inode_iget(fs, inumber, &inp);
    if (err < 0) { fprintf(stderr, "inode_iget returns error from file.c"); return err;}

    int inode_size = inode_getsize(&inp);
    int sectorNum = inode_indexlookup(fs, &inp, blockNum);
    if (sectorNum < 0) { fprintf(stderr, "sectorNum is negative"); return -1;}

    int numValidbytes = DISKIMG_SECTOR_SIZE;
    int num_full_block = inode_size/DISKIMG_SECTOR_SIZE;
    if (blockNum >= num_full_block)  {
        numValidbytes = inode_size - blockNum * DISKIMG_SECTOR_SIZE;
    }

    if (diskimg_readsector(fs->dfd, sectorNum, buf) < 0) { fprintf(stderr, "disk access error from file.c"); return -1;}

    return numValidbytes;
}
