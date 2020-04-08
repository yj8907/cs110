#include <stdio.h>
#include <assert.h>

#include <sys/types.h>
#include <unistd.h>
#include <math.h>
#include <string.h>

#include "inode.h"
#include "diskimg.h"

// remove the placeholder implementation and replace with your own
int inode_iget(struct unixfilesystem *fs, int inumber, struct inode *inp) {

    int inode_size = sizeof(struct inode);
    if (inumber < 1 || inumber * inode_size > fs->superblock.s_isize*DISKIMG_SECTOR_SIZE) return -1;

    int byte_offset = DISKIMG_SECTOR_SIZE * INODE_START_SECTOR + (inumber-1) * inode_size;
    int sectorNum = byte_offset/DISKIMG_SECTOR_SIZE;

    char buf[DISKIMG_SECTOR_SIZE];
    if (diskimg_readsector(fs->dfd, sectorNum, buf) < 0) return -1;

    int sector_offset = byte_offset - sectorNum*DISKIMG_SECTOR_SIZE;
    memcpy(inp, buf + sector_offset, inode_size);
    return 0;
}

// remove the placeholder implementation and replace with your own
int inode_indexlookup(struct unixfilesystem *fs, struct inode *inp, int blockNum) {

    if ( (inp->i_mode & IALLOC) == 0) return -1;

    int max_blockNum = inode_getsize(inp) / DISKIMG_SECTOR_SIZE;
    max_blockNum += inode_getsize(inp) % DISKIMG_SECTOR_SIZE == 0 ? 0 : 1;

    if (blockNum >= max_blockNum || blockNum < 0) return -1;

    if ( (inp->i_mode & ILARG) == 0) {
        if (blockNum >= NUM_BLOCK_ADDR) return -1;
        return inp->i_addr[blockNum];
    } else {
        int single_linked_size = DISKIMG_SECTOR_SIZE/sizeof(inp->i_addr[0]);

        uint16_t buf[DISKIMG_SECTOR_SIZE/ sizeof(inp->i_addr[0])];
        int i_adrr_blockNum = blockNum/single_linked_size;
        i_adrr_blockNum = i_adrr_blockNum < NUM_SINGLE_INDIRECT_BLOCK_ADDR
                ? i_adrr_blockNum: NUM_SINGLE_INDIRECT_BLOCK_ADDR;
        if (diskimg_readsector(fs->dfd, inp->i_addr[i_adrr_blockNum], buf) < 0) return -1;

        if (i_adrr_blockNum < NUM_SINGLE_INDIRECT_BLOCK_ADDR){
            blockNum = blockNum - i_adrr_blockNum * single_linked_size;
            return buf[blockNum];
        } else {
            blockNum = blockNum - i_adrr_blockNum * single_linked_size;
            int indirect_blockNum = blockNum/single_linked_size;

            if (diskimg_readsector(fs->dfd, buf[indirect_blockNum], buf) < 0) return -1;
            blockNum = blockNum - indirect_blockNum*single_linked_size;
            return buf[blockNum];
        }
    }

}

int inode_getsize(struct inode *inp) {
    return ( (inp->i_size0 << 16) | inp->i_size1);
}
