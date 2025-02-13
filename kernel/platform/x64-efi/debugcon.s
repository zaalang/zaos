#
# debugcon port 0x402
#

.intel_syntax noprefix

.code64

            .global dbgln

dbgln:      # (uintptr fd, ciovec *iovs, usize n) -> fd_result;
            test rdx, rdx
            je .bb5
            mov r8, rdx
            xor r9d, r9d
            xor edx, edx
            jmp .bb3
 .bb1:      xor ecx, ecx
 .bb2:      add rdx, rcx
            add r9, 1
            cmp r9, r8
            je .bb6
 .bb3:      mov rdi, r9
            shl rdi, 4
            cmp qword ptr [rsi + rdi + 8], 0
            je .bb1
            lea r10, [rsi + rdi]
            add r10, 8
            add rdi, rsi
            xor ecx, ecx
 .bb4:      mov rax, [rdi]
            mov al, [rax + rcx]
            mov dx, 0x402
            out dx, al
            add rcx, 1
            cmp rcx, [r10]
            jne .bb4
            jmp .bb2
 .bb5:      xor edx, edx
 .bb6:      xor eax, eax
            ret

.section .note.GNU-stack, "", @progbits
