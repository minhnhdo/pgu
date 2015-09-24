 .section .data

 .section .text
 .code32
 .globl _start

_start:
 pushl $12
 call square
 addl $4, %esp

 movl %eax, %ebx
 movl $1, %eax
 int $0x80

 .type square, @function
square:
 # empty function prolog, as no temporary variable is used

 movl 4(%esp), %eax
 imull %eax, %eax

 # function epilog, but with no restoration of %ebp and %esp
 ret
