#
# boot
#

.intel_syntax noprefix

.code64

            .global _start
            .global memset
            .global memcpy
            .global memmove
            .global memfind
            .global __null_chk_fail
            .global __div0_chk_fail
            .global __carry_chk_fail
            .global __stack_chk_fail
            .global _efi_call0
            .global _efi_call1
            .global _efi_call2
            .global _efi_call3
            .global _efi_call4
            .global _efi_call5

            .section .data

            .align 64
            .fill 256, 8      # tls data
 .tcb:      .quad $           # self
            .quad 0           #
            .quad 0           #
            .quad 0           #
            .quad 0           #
            .quad 0xdeadbeef  # canary
            .quad 0           #
            .quad 0           #
            .quad 0           #
            .quad 0           #

            .section .text

_start:
            and rsp, -16
            mov rbp, rsp
            push rcx                      # [rbp - 8]  Handle
            push rdx                      # [rbp - 16] System Table
            sub rsp, 4*8                  # shadow space rcx, rdx, r8, r9

            # check signature
            test rdx, rdx
            jz halt
            mov rax, 0x5453595320494249
            cmp [rdx], rax
            jne halt

            # thread control block
            lea rax, [rip + .tcb]
            lea rdx, [rip + .tcb]
            shr rdx, 32
            mov ecx, 0xC0000100           # set fs
            wrmsr

            # relocations
            lea rdi, [rip + _BASE]
            lea rsi, [rip + _DYNAMIC]
            mov rdx, rdi
            call reloc

            # start
            mov rdi, [rbp - 8]
            mov rsi, [rbp - 16]
            call efi_main

 halt:      cli
            hlt
            jmp halt

memset:
            mov r9, rdi
            mov rax, rsi
            mov rcx, rdx
            rep stosb
            mov rax, r9
            ret

memcpy:
            mov rax, rdi
            mov rcx, rdx
            rep movsb
            ret

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

__null_chk_fail:
            jmp exit

__div0_chk_fail:
            jmp exit

__carry_chk_fail:
            jmp exit

__stack_chk_fail:
            jmp exit

_efi_call0:
            sub rsp, 40
            call rdi
            add rsp, 40
            ret

_efi_call1:
            sub rsp, 40
            mov rcx, rsi
            call rdi
            add rsp, 40
            ret

_efi_call2:
            sub rsp, 40
            #mov rdx, rdx
            mov rcx, rsi
            call rdi
            add rsp, 40
            ret

_efi_call3:
            sub rsp, 40
            mov r8, rcx
            #mov rdx, rdx
            mov rcx, rsi
            call rdi
            add rsp, 40
            ret

_efi_call4:
            sub rsp, 40
            mov r9, r8
            mov r8, rcx
            #mov rdx, rdx
            mov rcx, rsi
            call rdi
            add rsp, 40
            ret

_efi_call5:
            sub rsp, 40
            mov [rsp + 32], r9
            mov r9, r8
            mov r8, rcx
            #mov rdx, rdx
            mov rcx, rsi
            call rdi
            add rsp, 40
            ret

.section .note.GNU-stack, "", @progbits
