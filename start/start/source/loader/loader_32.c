#include "loader.h"

// https://wiki.osdev.org/ATA_PIO_Mode
// sector:扇区号        sector_count:扇区数目
static void read_disk(uint32_t sector, uint32_t sector_count, uint8_t *buffer){
    // 48 bit PIO
    // 0x40 : LBA, slavebit << 4 : DRV, 第一块硬盘为0，所以slavebit = 0, 0x1010 0000,固定为1的位， 最终0x1110 0000(0xE0)
    outb(0x1F6, (uint8_t)(0xE0));

    outb(0x1F2, (uint8_t)(sector_count >> 8));
    outb(0x1F3, (uint8_t)(sector >> 24));   // 24-31
    outb(0x1F4, 0);
    outb(0x1F5, 0);

    outb(0x1F2, (uint8_t)(sector_count));
    outb(0x1F3, (uint8_t)(sector));   // 0-7
    outb(0x1F4, (uint8_t)(sector >> 8));    // 8-15
    outb(0x1F5, (uint8_t)(sector >> 16));   // 16-23

    outb(0x1F7, (uint8_t)0x24);
    
    // 应检查是否出现错误，发生错误没有解决方式，这里不进行检查
    // 依次查看各个扇区的状态，是否 忙和就绪
    uint16_t *data_buf = (uint16_t *)buffer;
    while(sector_count-- > 0){
        while((inb(0x1F7) & 0x88) != 0x8){}             // 没有就绪原地等待
        //就绪后开始读取扇区
        for(uint16_t i = 0; i < SECTOR_SIZE / 2; i++){       // 一个扇区512字节，每次读取16位两个字节，循环256次
            *data_buf++ = inw(0x1F0);                   // 将内核代码写入内存
        }
    }

}

static uint32_t reload_elf_file(uint8_t *file_buffer){
    Elf32_Ehdr *elf_hdr = (Elf32_Ehdr *)file_buffer;
    // 检查file_buffer是否为ELF文件，ELF文件第一个字节为0x7F,然后为ELF(0x45, 0x4C, 0x46)，发生错误直接返回1
    if((elf_hdr->e_ident[0] != 0x7F) || (elf_hdr->e_ident[1] != 'E')
        || (elf_hdr->e_ident[2] != 'L') || (elf_hdr->e_ident[3] != 'F')){
            return 1;
        }
    // 从ELF文件提取代码和数据到内存
    for(int i = 0; i < elf_hdr->e_phnum; i++){
        Elf32_Phdr * phdr = (Elf32_Phdr *)(file_buffer + elf_hdr->e_phoff) + i;
        // 检查表项是否可以加载
        if(phdr->p_type != PT_LOAD){
            continue;
        }

        // 拷贝到内存.text .rodata .data
        uint8_t *src = file_buffer + phdr->p_offset;
        uint8_t *dest = (uint8_t *)phdr->p_paddr;
        for(int j = 0; j < phdr->p_filesz; j++){
            *dest++ = *src++;
        }
        // 拷贝到内存.bss,清零
        dest = (uint8_t *)phdr->p_paddr + phdr->p_filesz;
        for(int j = 0; j < phdr->p_memsz - phdr->p_filesz; j++){
            *dest++ = 0;
        }
    }
    return elf_hdr->e_entry;
}

// 死机操作，让系统陷入死循环，后面改进比如打印错误信息
static void die(int code){
    for(;;){}
}

void load_kernel(void){     // 此时进入32位保护模式运行环境，可访问4BG内存空间
    read_disk(100, 500, (uint8_t *)SYS_KERNEL_LOAD_ADDR);    // 从第100个扇区开始后的500个扇区,250KB      指定从1M内存处开始加载内核elf文件
    
    uint32_t kernel_entry = reload_elf_file((uint8_t *)SYS_KERNEL_LOAD_ADDR);       // 将加载到1M处的内核ELF文件重新加载到64KB(0x10000)处,对ELF文件进行解析
    
    // 检查内核起始地址值，发生错误进行死机
    if(kernel_entry == 0){
        die(-1);
    }

    // 跳转到kernel_init，将boot_info作为一个参数进行函数调用，进行函数调用时会将参数压入栈中，SYS_KERNEL_LOAD_ADDR地址处实际执行的是汇编的start
	((void(*)(boot_info_t *))kernel_entry)(&boot_info);
    for(;;){}
}