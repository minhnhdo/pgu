 .section .data

data_items:
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
data_count:
 .long 14

 .section .text

 .globl _start, data_items, data_end

_start:
 movl $0, %edi
 movl data_items(,%edi,4), %ebx
start_loop:
 cmpl data_count, %edi
 jge program_exit
 movl data_items(,%edi,4), %eax
 cmpl %ebx, %eax
 jle end_loop
 movl %eax, %ebx
end_loop:
 incl %edi
 jmp start_loop
program_exit:
 movl $1, %eax
 int $0x80
