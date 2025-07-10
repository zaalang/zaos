#
# debugcon port 0x402
#

.intel_syntax noprefix

.code64

            .global dbgln

dbgln:      # (uintptr fd, u8 *buffer, usize length) -> void;
            test rdx, rdx
            je .L2
            lea rdi, [rsi+rdx]
 .L3:       mov al, [rsi]
            mov dx, 0x402
            out dx, al
            add rsi, 1
            cmp rsi, rdi
            jne .L3
 .L2:       xor eax, eax
            ret

.section .note.GNU-stack, "", @progbits
