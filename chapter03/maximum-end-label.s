 .section .data

data_items:
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
data_end:

 .section .text

 .globl _start, data_items, data_end

_start:
 movl $data_items, %edi
 movl (%edi), %ebx
start_loop:
 cmpl $data_end, %edi
 je program_exit
 movl (%edi), %eax
 cmpl %ebx, %eax
 jle end_loop
 movl %eax, %ebx
end_loop:
 addl $4, %edi
 jmp start_loop
program_exit:
 movl $1, %eax
 int $0x80
