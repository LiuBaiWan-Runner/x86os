#ifndef LOADER_H
#define LOADER_H

#include "boot_info.h"
#include "types.h"
#include "cpu_instr.h"
#include "elf.h"

// 汇编中的远跳转函数声明
void protect_mode_entry(void);

// 参数调用声明
extern boot_info_t boot_info;

typedef struct SMAP_entry{

    uint32_t BaseL;     // base address uint64_t
    uint32_t BaseH;
    uint32_t LengthL;   // length uint64_t
    uint32_t LengthH;
    uint32_t Type;      // entry Type   值为1时表明为可用的RAM空间
    uint32_t ACPI;      // extended, bit0 = 0 时表明此条目因该被忽略

}__attribute__((packed)) SMAP_entry_t;

#endif
