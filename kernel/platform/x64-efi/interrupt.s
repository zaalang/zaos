#
# interrupt
#

.altmacro
.intel_syntax noprefix

.macro isr.dispatch irq, name, param = no
            .align 64
            clac
            .if \param == no
              push rax
            .endif
            push qword ptr [rsp + 8]      # fake return address
            push rbp
            mov rbp, rsp                  # fake stack frame
            push rdi
            lea rdi, [rbp + 24]           # frame address
            push rsi
            mov rsi, \irq                 # irq number
            push rdx
            mov rdx, [rbp + 16]           # errorcode
            push rcx
            lea rcx, [rip + \name]        # handler
            jmp isr_common
.endm

.code64
            .global isr_table

            .align 64
isr_table:
            isr.dispatch 0 unhandled_exception_handler
            isr.dispatch 1 fatal_exception_handler
            isr.dispatch 2 nmi_handler
            isr.dispatch 3 breakpoint_handler
            isr.dispatch 4 unhandled_exception_handler
            isr.dispatch 5 unhandled_exception_handler
            isr.dispatch 6 unhandled_exception_handler
            isr.dispatch 7 fatal_exception_handler
            isr.dispatch 8 double_fault_handler errorcode
            isr.dispatch 9 fatal_exception_handler
            isr.dispatch 10 fatal_exception_handler errorcode
            isr.dispatch 11 fatal_exception_handler errorcode
            isr.dispatch 12 stack_fault_handler errorcode
            isr.dispatch 13 general_protection_fault_handler errorcode
            isr.dispatch 14 page_fault_handler errorcode
            isr.dispatch 15 fatal_exception_handler
            isr.dispatch 16 unhandled_exception_handler
            isr.dispatch 17 unhandled_exception_handler errorcode
            isr.dispatch 18 machine_check_exception_handler
            isr.dispatch 19 unhandled_exception_handler
            isr.dispatch 20 fatal_exception_handler

            .rept 11
              .fill 64
            .endr

            .set irq, 32
            .rept 220
              isr.dispatch %irq io_dispatch_handler
            .set irq, irq + 1
            .endr

            isr.dispatch 0xfc apic_timer_interrupt_handler
            isr.dispatch 0xfd apic_ipi_interrupt_handler
            isr.dispatch 0xfe apic_error_interrupt_handler
            isr.dispatch 0xff apic_spurious_interrupt_handler

isr_common:
            push r11
            push r10
            push r9
            push r8
            push rax
            rdfsbase r11
            push r11                      # save fs
            swapgs
            rdgsbase r11
            wrfsbase r11                  # load tls frame
            swapgs
            cld

            call rcx                      # call handler

            test byte ptr [rbp + 32], 0x3 # if from user
            jz 1f
            mov r11, [fs:tss@tpoff + 4]   # rsp0
            test qword ptr [r11], 0x2     # killed ?
            jz 1f
            wrgsbase r11
            call terminate

 1:         cli
            pop r11
            test byte ptr [rbp + 32], 0x3 # if from user
            jz 2f
            wrfsbase r11                  # restore fs
 2:         pop rax
            pop r8
            pop r9
            pop r10
            pop r11
            pop rcx
            pop rdx
            pop rsi
            pop rdi
            pop rbp
            add rsp, 16
            iretq

.section .note.GNU-stack, "", @progbits
