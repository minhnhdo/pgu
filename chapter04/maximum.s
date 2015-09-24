 .section .data

# data_items contains the item data. A 0 is used to terminate the data.
data_items:        # These are the data items
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

 .section .text
 .code32
 .globl _start

_start:
 pushl $data_items
 call maximum
 addl $4, %esp

 pushl $data_items
 call maximum
 addl $4, %esp

 pushl $data_items
 call maximum
 addl $4, %esp

 movl %eax, %ebx
 movl $1, %eax                  # 1 is the exit() syscall

 int $0x80

 .type maximum, @function
maximum:
 # empty function prolog

 movl 4(%esp), %ecx
 movl $0, %edi                  # move 0 into the index of the register
 movl (%ecx,%edi,4), %ebx       # load the first byte of the data
 movl %ebx, %eax                # since this is the first item, %eax is
                                # the biggest

start_loop:                     # start loop
 cmpl $0, %ebx                  # check to see if we hit the end
 je loop_exit
 incl %edi                      # load next value
 movl (%ecx,%edi,4), %ebx
 cmpl %eax, %ebx                # compare values
 jle start_loop                 # jump to loop beginning if the new one
                                # isn't bigger
 movl %ebx, %eax                # move the value as the largest
 jmp start_loop                 # jump to the loop beginning

loop_exit:
 # function epilog without restoration of %ebp and %esp
 ret
