#
# memset.s
#

.intel_syntax noprefix

.code64

            .global memset

memset:
            mov r9, rdi
            mov rax, rsi
            mov rcx, rdx
            rep stosb
            mov rax, r9
            ret

.section .note.GNU-stack, "", @progbits
