 .section .data
 .section .text
 .globl _start
_start:
 movl _start, %eax
 movl $0, %ebx       # deliberately causing a segfault value of %eax can be
                     # viewed in gdb
