__asm__(".code16gcc");

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
void loader_entry(){
    show_msg("......loading......\n\r");
    for(;;){}
}