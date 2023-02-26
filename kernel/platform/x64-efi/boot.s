#
# boot
#

.intel_syntax noprefix

.code64

            .global _start
            .global enter_kernel
            .global _efi_call0
            .global _efi_call1
            .global _efi_call2
            .global _efi_call3
            .global _efi_call4
            .global _efi_call5

_start:
            and rsp, -16
            mov rbp, rsp
            push rcx                      # [rbp - 8]  Handle
            push rdx                      # [rbp - 16] System Table
            sub rsp, 4*8                  # shadow space rcx, rdx, r8, r9

            # check signature
            test rdx, rdx
            jz .halt
            mov rax, 0x5453595320494249
            cmp [rdx], rax
            jne .halt

            # clear screen
            #mov rcx, [rbp - 16]
            #mov rcx, [rcx + 64]          # ConOut*
            #call [rcx + 48]              # ClearScreen

            # output dot
            mov rcx, [rbp - 16]
            mov rcx, [rcx + 64]           # ConOut*
            lea rdx, [rip + .dot]
            call [rcx + 8]                # OutputString

            # relocations
            lea rdi, [rip + _BASE]
            lea rsi, [rip + _DYNAMIC]
            mov rdx, rdi
            call reloc

            # start
            mov rdi, [rbp - 8]
            mov rsi, [rbp - 16]
            call efi_main

 .halt:     cli
            hlt
            jmp .halt

 .dot:      .ascii ".\0\0\0"

enter_kernel:

            # paging
            mov rax, [rdi + 8]            # pml4
            mov cr3, rax

            # global descriptor table
            mov rax, [rdi + 0]            # gdt
            mov [rsp - 16], word ptr 39   # descriptor size
            mov [rsp - 14], rax           # descriptor offset
            lgdt [rsp - 16]
            push 0x8
            lea rax, [rip + .llmode]
            push rax
            retfq

            .align 8

 .llmode:
            mov ax, 0x10
            mov ss, ax
            xor ax, ax
            mov ds, ax
            mov es, ax
            mov fs, ax
            mov gs, ax

            # setup
            mov rax, 0x80010011
            mov cr0, rax
            fninit
            mov rax, 0x000106e0
            mov cr4, rax

            mov ecx, 0xc0000080
            rdmsr
            or eax, 0x800                 # NX
            wrmsr

            # thread control block
            mov eax, [rdi + 32]
            mov edx, [rdi + 36]
            mov ecx, 0xC0000100           # set fs
            wrmsr
            mov ecx, 0xC0000101           # set gs
            wrmsr
            mov ecx, 0xC0000102           # set kernel gs
            wrmsr

            # stack
            mov rsp, [fs:8]               # stacktop
            push qword ptr 0              # return address
            push rdi                      # bootinfo
            push qword ptr 0              # cpu index

            xor rbp, rbp
            push 0
            popf

            # relocations
            mov rdx, [rdi + 16]           # kernel_base
            lea rdi, [rip + _BASE]
            lea rsi, [rip + _DYNAMIC]
            call reloc

            # kernel
            pop rsi
            pop rdi
            mov rdx, [rdi + 16]           # kernel_base
            lea rcx, [rip + _BASE]
            lea rax, [rip + kernel_start]
            sub rax, rcx
            add rax, rdx
            jmp rax

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
