#
# start
#

.intel_syntax noprefix

.code64

            .global _start

_start:
            xor rbp, rbp
            mov rdi, [rsp]        # argc
            lea rsi, [rsp+8]      # argv
            mov rax, rdi
            shl rax, 4
            lea rdx, [rsp+rax+24] # envp
            and rsp, -16
            call __start
            ud2

.section .note.GNU-stack, "", @progbits
