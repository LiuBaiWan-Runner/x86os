
    .text
    .extern kernel_init
    .global _start

    # void start(boot_info_t *boot_info)
_start:
    push %ebp
    mov %esp, %ebp
    mov 0x8(%ebp), %eax     # 模拟从栈中取出boot_info参数

    # mov 4(%esp), %eax     # 等同于上边四句

    # kernel_init(boot info)
    push %eax
    call kernel_init
    jmp . 