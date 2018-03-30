#cpuid.s Sample program to exrract the processor Vendor ID
#ver1.0:using linux system call
#.section .data
#output:
#    .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"
#
#.section .bss
#
#.section .text
#.global _start
#_start:
#    mov  $0, %eax
#    cpuid
#    movl $output, %edi
#    movl %ebx, 28(%edi)
#    movl %edx, 32(%edi)
#    movl %ecx, 36(%edi)
#    movl $4,   %eax
#    movl $1,   %ebx
#    movl $output, %ecx
#    movl $42,  %edx
#    int  $0x80
#    movl $1,   %eax
#    movl $0,   %ebx
#    int  $0x80
#########################################
#ver2.0:using C library function
.code32
.section .data
output:
    .asciz "The processor Vendor ID is '%s'\n"

.section .bss
    .lcomm buffer, 12
.section .text
.global _start
_start:
    movl $0, %eax
    cpuid
    movl $buffer, %edi
    movl %ebx,  (%edi)
    movl %edx, 4(%edi)
    movl %ecx, 8(%edi)
    pushl $buffer
    pushl $output
    call printf
    addl $8, %esp
    pushl $0
    call exit
