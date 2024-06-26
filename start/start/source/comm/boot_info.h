#ifndef BOOT_INFO_H
#define BOOT_INFO_H

#include "types.h"

#define BOOT_RAM_REGION_MAX     10

typedef struct _boot_info_t{
    struct {
        uint32_t start;
        uint32_t size;
    } ram_region_cfg[BOOT_RAM_REGION_MAX];

    int ram_region_count;

} boot_info_t;

#define LOADER_START_ADDR 0x8000

#define SECTOR_SIZE             512             // 一个扇区大小512字节
#define SYS_KERNEL_LOAD_ADDR    (1024 * 1024)   // 从1M内存开始处加载内核

#endif