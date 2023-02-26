#
# memfind.s
#

.intel_syntax noprefix

.code64

            .global memfind

memfind:
            mov rax, rsi
            mov rcx, rdx
            repne scasb
            je .found
            mov rax, rdx
            ret

 .found:    mov rax, rdx
            sub rax, rcx
            sub rax, 1
            ret

.section .note.GNU-stack, "", @progbits
