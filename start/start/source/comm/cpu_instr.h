#ifndef CPU_INSTR_H
#define CPU_INSTR_H

#include "types.h"

static inline uint8_t inb(uint16_t port){
    uint8_t value;
    // inb al, dx
    __asm__ __volatile__(
        "inb %[port], %[value]"
        : [value]"=a"(value)
        : [port]"d"(port)
    );
    return value;
}

static inline void outb(uint16_t port, uint8_t data){
    // outb al, dx
    __asm__ __volatile__(
        "outb %[data], %[port]"
        :
        : [data]"a"(data), [port]"d"(port)
    );
}

static inline void cli(void){
    __asm__ __volatile__("cli");
}

static inline void sti(void){
    __asm__ __volatile__("sti");
}

static inline void lgdt(uint32_t start, uint32_t size){
    struct{
        uint16_t limit;
        uint32_t start15_0;
        uint32_t start31_16;
    }gdt;

    gdt.start31_16 = start >> 16;
    gdt.start15_0 = start & 0xffff;
    gdt.limit = size - 1;

    __asm__ __volatile__(
        "lgdt %[g]"
        :
        :[g]"m"(gdt)
    );
}

#endif