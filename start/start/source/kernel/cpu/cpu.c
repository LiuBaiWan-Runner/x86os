#include "cpu/cpu.h"

static segment_desc_t gdt_table[GDT_TABLE_SIZE];

// 设置GDT表项
void segment_desc_set(int selector, uint32_t base, uint32_t limit, uint16_t attr){
    segment_desc_t *desc = gdt_table + (selector >> 3);     // GDT表从第二项开始，第一项不使用

    desc->limit15_0 = limit & 0xFFFF;
    desc->base15_0 = base & 0xFFFF;
    desc->base23_16 = (base >> 16) & 0xFF;
    desc->attr = attr | (((limit >> 16) & 0xF) << 8);
    desc->base31_24 = (base >> 24) & 0xFF;
}

void gdt_init(void){
    for(int i = 0; i < GDT_TABLE_SIZE; i++){
        segment_desc_set(i << 3, 0, 0, 0);
    }
}

void cpu_init(void){
    gdt_init();
}