#
# trampoline
#

.intel_syntax noprefix

.code64

            .global _trampoline
            .global trampoline_

_trampoline:

.code16
 .L8000:
            jmp 0x0:0x8080

            .align 16

 .L8010:    .quad 0                       # gdt
 .L8018:    .quad 0                       # pml4

            .align 64

 .L8040:    .quad 0
            .quad 0x00cf9a000000ffff      # flat code
            .quad 0x008f92000000ffff      # flat data
            .quad 0x00Cf890000000068      # tss

 .L8060:    .word 31                      # gdt size
            .long 0x8040                  # gdt address
            .long 0
            .long 0

            .align 64

 .L8080:    cli
            cld
            xor ax, ax
            mov ds, ax
            lgdt [0x8060]
            mov eax, cr0
            or eax, 1
            mov cr0, eax
            jmp 0x8:0x80A0

            .align 32

.code32
 .L80A0:    mov ax, 0x10
            mov ss, ax
            mov ds, ax
            mov es, ax
            mov fs, ax
            mov gs, ax

            mov eax, 1
            cpuid
            shr ebx, 24
            mov edi, ebx                  # edi apic_id

            # 64 byte stack
            shl ebx, 6
            mov esp, 0x10000
            sub esp, ebx
            sub esp, 8                    # cpu index
            sub esp, 8                    # bootinfo

            # enable PAE and PGE
            mov eax, cr4
            or eax, (1 << 5) | (1 << 7)
            mov cr4, eax

            # paging
            mov eax, [0x8018]             # pml4
            mov cr3, eax

            # enable long mode
            mov ecx, 0xc0000080
            rdmsr
            or eax, (1 << 8)
            wrmsr

            # compatibility mode
            mov eax, cr0
            or eax, (1 << 31)
            mov cr0, eax

            # global descriptor table
            mov eax, [0x8010]              # gdt
            mov [esp - 16], word ptr 39    # descriptor size
            mov [esp - 14], eax            # descriptor offset
            lgdt [esp - 16]
            push 0x8
            lea eax, [0x8000 + (.llmode - .L8000)]
            push eax
            retf

            .align 8

.code64
 .llmode:   mov ax, 0x10
            mov ss, ax
            xor ax, ax
            mov ds, ax
            mov es, ax
            mov fs, ax
            mov gs, ax

            # arguments
            pop rdi                       # bootinfo
            pop rsi                       # cpu index

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
            mov eax, [rdi + rsi*8 + 32]
            mov edx, [rdi + rsi*8 + 36]
            mov ecx, 0xC0000100           # set fs
            wrmsr
            mov ecx, 0xC0000101           # set gs
            wrmsr
            mov ecx, 0xC0000102           # set kernel gs
            wrmsr

            # stack
            mov rsp, [fs:0x8]             # stacktop
            push qword ptr 0              # return address
            push rdi                      # bootinfo
            push rsi                      # cpu index

            xor rbp, rbp
            push 0
            popf

            # kernel
            pop rsi
            pop rdi
            mov rdx, [rdi + 16]           # kernel_base
            lea rcx, [rip + _BASE]
            lea rax, [rip + kernel_auxap]
            sub rax, rcx
            add rax, rdx
            jmp rax

trampoline_:

.section .note.GNU-stack, "", @progbits
