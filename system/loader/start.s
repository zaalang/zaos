#
# start
#

.intel_syntax noprefix

.code64

            .global _dlstart

_dlstart:
            xor rbp, rbp
            mov rdi, [rsp]        # argc
            lea rsi, [rsp+8]      # argv
            mov rax, rdi
            shl rax, 4
            lea rdx, [rsp+rax+24] # envp
            call main
            jmp rax

.section .note.GNU-stack, "", @progbits
