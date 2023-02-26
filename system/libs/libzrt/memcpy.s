#
# memcpy.s
#

.intel_syntax noprefix

.code64

            .global memcpy

memcpy:
            mov rax, rdi
            mov rcx, rdx
            rep movsb
            ret

.section .note.GNU-stack, "", @progbits
