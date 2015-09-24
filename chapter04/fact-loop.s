 .section .data

 .section .text
 .code32
 .globl _start
 .globl factorial

_start:
 pushl $5
 call factorial
 addl $4, %esp

 movl %eax, %ebx

 movl $1, %eax
 int $0x80

 .type factorial, @function
factorial:
 # empty function prolog

 movl 4(%esp), %ebx

 cmpl $0, %ebx
 jl loop_end

loop_init:
 movl $1, %eax
loop_body:
 cmpl $1, %ebx
 jle loop_end
 imull %ebx, %eax
 decl %ebx
 jmp loop_body
loop_end:
 # function epilog without %ebp and %esp
 ret
