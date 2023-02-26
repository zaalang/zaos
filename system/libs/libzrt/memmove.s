#
# memmove.s
#

.intel_syntax noprefix

.code64

            .global memmove

memmove:
            mov rax, rdi
            sub rax, rsi
            cmp rax, rdx
            jae .fwd

 .bck:      mov rax, rdi
            mov rcx, rdx
            lea rsi, [rsi + rdx - 1]
            lea rdi, [rdi + rdx - 1]
            std
            rep movsb
            cld
            ret

 .fwd:      mov rax, rdi
            mov rcx, rdx
            rep movsb
            ret

.section .note.GNU-stack, "", @progbits
