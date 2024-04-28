/**
 * 系统引导部分，启动时由硬件加载运行，然后完成对二级引导程序loader的加载
 * 该部分程序存储于磁盘的第1个扇区，在计算机启动时将会由BIOS加载到0x7c00处
 * 之后，将由BIOS跳转至0x7c00处开始运行
 */

.code16     //十六位实模式
.text       
.global _start
.extern boot_entry
_start:
    // 初始化配置寄存器
    mov $0, %ax
    mov %ax, %ds
    mov %ax, %ss
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs

    // 将栈指针移动到_start即0x7C00处
    mov $_start, %esp
	
	// 调用int 10 软中断，打印字符 L
    mov $0xe, %ah
    mov $'L', %al
    int $0x10

/*
    // 打印 "Hello!"
    mov $0xe, %ah
    mov $'H', %al    // 打印 'H'
    int $0x10

    mov $0xe, %ah
    mov $'e', %al    // 打印 'e'
    int $0x10

    mov $0xe, %ah
    mov $'l', %al    // 打印 'l'
    int $0x10

    mov $0xe, %ah
    mov $'l', %al    // 打印 'l'
    int $0x10

    mov $0xe, %ah
    mov $'o', %al    // 打印 'o'
    int $0x10

    mov $0xe, %ah
    mov $'!', %al    // 打印 '!'
    int $0x10
    */

// 利用BIOS INT(13) 软中断读取磁盘，将loader读入内存（16位）
read_loader:
    mov $0x0240, %ax    //ah = 0x02, al = 扇区数，64个扇区
    mov $0x8000, %bx    //es:bx:段地址加偏移量，指定loader要存在内存中的起始地址，从BOOT的结束处0x8000开始
    mov $0x0002, %cx    //ch = 柱面号，0号柱面， cl = 扇区号，2号扇区，在BIOS中扇区编号从1开始
    mov $0x0080, %dx    //dh = 磁头号，0号磁头， dl = 驱动器，0x00-0x7f为软盘，0x80-0xff为硬盘
    int $0x13
    jc read_loader

    jmp boot_entry

	// 跳转到引导结束处
    jmp .

// 引导结束段
.section boot_end, "ax"
boot_sig: .byte 0x55, 0xaa
