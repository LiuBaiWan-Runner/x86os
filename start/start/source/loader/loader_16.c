__asm__(".code16gcc");

#include "loader.h"

static boot_info_t boot_info;

// 使用内联汇编打印字符串
static void show_msg (const char *msg){
    char c;

    while((c = *msg++) != '\0'){
        __asm__ __volatile(         //避免GCC编译器对内联汇编进行优化，强制要求GCC不进行优化
            "mov $0xe, %%ah\n\t"
            "mov %[ch], %%al\n\t"
            "int $0x10"
            :
            :[ch]"r"(c)
        );
    }
}

// 检测内存容量
static void detect_memory(void){
    SMAP_entry_t smap_entry;
    uint32_t contID = 0, signature, bytes;

    show_msg("Trying to detect memory: ");

    boot_info.ram_region_count = 0;
    for(int i = 0; i < BOOT_RAM_REGION_MAX; i++){
        SMAP_entry_t *entry = &smap_entry;
        __asm__ __volatile__(
            "int $0x15"
            :"=a"(signature), "=c"(bytes), "=b"(contID)
            :"a"(0xE820), "b"(contID), "c"(24), "d"(0x534D4150), "D"(entry));
        if(signature != 0x534D4150){
            show_msg("Falied!\n\r");
            return;
        }
        if(bytes > 20 && (entry->ACPI & 0x0001) == 0){
            // ignore this entry
            continue;
        }
        if(entry->Type == 1){
            //记录当前可用内存空间的起始地址和大小，使用低32位
            boot_info.ram_region_cfg[boot_info.ram_region_count].start = entry->BaseL;
            boot_info.ram_region_cfg[boot_info.ram_region_count].size = entry->LengthL;
            boot_info.ram_region_count++;
        }
        if(contID == 0){
            //读取结束
            break;
        }
    }
    show_msg("Successful!\n\r");
}

void loader_entry(){
    show_msg("......loading......\n\r");
    detect_memory();
    for(;;){}
}