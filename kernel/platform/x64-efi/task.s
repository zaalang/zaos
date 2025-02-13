#
# task
#

.intel_syntax noprefix

.code64

            .global platform_task_fork
            .global platform_task_enter
            .global platform_task_switch
            .global platform_task_switch_full
            .global platform_task_transition
            .global platform_task_on_stack
            .global __chkstk
            .global tss

            .section .tdata

            .align 64
tss:        .long 0    # _reserved1
            .quad 0    # rsp[0]
            .quad 0    # rsp[1]
            .quad 0    # rsp[2]
            .quad 0    # _reserved2
            .quad 0    # ist[0]
            .quad 0    # ist[1]
            .quad 0    # ist[2]
            .quad 0    # ist[3]
            .quad 0    # ist[4]
            .quad 0    # ist[5]
            .quad 0    # ist[6]
            .quad 0    # _reserved3
            .word 0    # _reserved4
            .word 0    # io_map_base

            .section .text

platform_task_fork: # uintptr mut &sp, uintptr ip, void mut *data
            push rbp
            mov rbp, [rdi]
            mov [rbp - 8], rsi               # address
            mov [rbp - 16], rdx              # data
            lea rax, [rip + platform_task_entry]
            mov [rbp - 24], rax              # resume ip
            sub rbp, 3*8
            mov [rdi], rbp
            pop rbp
            ret

platform_task_enter: # uintptr mut &sp, uintptr ip, void mut *data
            mov rsp, [rdi]
            push rsi                         # address
            push rdx                         # data
            jmp platform_task_entry

platform_task_switch: # uintptr mut &from, uintptr to
            push rbp
            push r15
            push r14
            push r13
            push r12
            push rbx
            rdgsbase rax
            push rax
            lea rax, [rip + 1f]
            push rax

            mov [rdi], rsp
            mov rsp, rsi
            ret

 1:         pop rax
            wrgsbase rax
            pop rbx
            pop r12
            pop r13
            pop r14
            pop r15
            pop rbp
            ret

platform_task_switch_full: # uintptr mut &from, uintptr to
            push rbp
            push r15
            push r14
            push r13
            push r12
            push rbx
            rdgsbase rax
            push rax
            lea rax, [rip + 1f]
            push rax

            # save fpu
            mov rbp, rsp
            sub rbp, 2568
            and rbp, ~63
            mov qword ptr [rbp + 512], 0  # clear XSTATE_BV
            mov qword ptr [rbp + 520], 0  #
            mov qword ptr [rbp + 528], 0  #
            mov qword ptr [rbp + 536], 0  #
            mov qword ptr [rbp + 544], 0  #
            mov qword ptr [rbp + 552], 0  #
            mov qword ptr [rbp + 560], 0  #
            mov qword ptr [rbp + 568], 0  #
            mov eax, 0xffffffff
            mov edx, 0xffffffff
            xsave64 [rbp]

            mov [rdi], rsp
            mov rsp, rsi
            ret

 1:         # restore fpu
            mov rbp, rsp
            sub rbp, 8
            sub rbp, 2568
            and rbp, ~63
            mov eax, 0xffffffff
            mov edx, 0xffffffff
            xrstor64 [rbp]

            pop rax
            wrgsbase rax
            pop rbx
            pop r12
            pop r13
            pop r14
            pop r15
            pop rbp
            ret

platform_task_transition: # uintptr ip, uintptr sp
            cli
            xor rax, rax
            wrfsbase rax
            wrgsbase rax
            mov rcx, rdi                  # rip
            mov rsp, rsi                  # rsp
            mov r11, 0x3202               # rflags
            sysretq

platform_task_entry:
            xor rbp, rbp
            pop rdi
            pop rcx
            mov rax, [fs:tss@tpoff + 4]   # task self
            wrgsbase rax
            mov [rsp - 8], qword ptr 0x1f80
            ldmxcsr [rsp - 8]
            jmp rcx

platform_task_on_stack:
            push rbp
            mov rbp, rsp
            mov rsp, rdx
            and rsp, -16
            call rsi
            mov rsp, rbp
            pop rbp
            ret

__chkstk:
            push rcx
            mov rcx, [fs:tss@tpoff + 4]
            test rcx, rcx
            je 1f
            mov rcx, [rcx + 16]           # task bp (top of stack)
            add rcx, rax
            cmp rsp, rcx
            jle __stack_chk_fail
 1:         pop rcx
            ret

.section .note.GNU-stack, "", @progbits
