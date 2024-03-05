#
# syscall
#

.altmacro
.intel_syntax noprefix

.code64

            .global syscall_entry

            .section .data
            .set SYSCALL_COUNT, 23
systable:   .quad sys_thread_exit
            .quad sys_process_exit
            .quad sys_get_pagesize
            .quad sys_mmap
            .quad sys_munmap
            .quad sys_ioring_setup
            .quad sys_ioring_enter
            .quad sys_ioring_destroy
            .quad sys_clock_res
            .quad sys_clock_time
            .quad sys_get_pid
            .quad sys_get_tid
            .quad sys_get_uid
            .quad sys_get_euid
            .quad sys_get_gid
            .quad sys_get_egid
            .quad sys_process_create_wrapper
            .quad sys_process_kill
            .quad sys_thread_create
            .quad sys_thread_munmap_exit
            .quad sys_wait
            .quad sys_futex_wait
            .quad sys_futex_wake
            #.quad syscall_7_wrapper
            #.quad syscall_8_wrapper
            #.quad syscall_9_wrapper
            #.quad syscall_10_wrapper

            .section .tdata
usersp:     .quad 0

            .section .text

syscall_entry:
            # rax - syscall number
            # rcx - rip from syscall instruction
            # r11 - flags from syscall instruction
            # rsp - user stack
            # rdi - arg 1
            # rsi - arg 2
            # rdx - arg 3
            # r10 - arg 4
            # r8  - arg 5
            # r9  - arg 6
            # r12 - arg 7
            # r13 - arg 8
            # r14 - arg 9
            # r15 - arg 10

            swapgs
            mov [gs:usersp@tpoff], rsp
            mov rsp, [gs:tss@tpoff + 4]
            push [gs:usersp@tpoff]        # rsp
            push r11                      # flags
            push rcx                      # fake return address
            push rbp                      # fake stack frame
            mov rbp, rsp
            rdfsbase r11
            push r11                      # save fs
            rdgsbase r11
            wrfsbase r11                  # load tls frame
            swapgs
            rdgsbase r11
            push r11                      # save gs
            mov r11, [fs:tss@tpoff + 4]   # rsp0
            wrgsbase r11
            mov rcx, r10                  # arg 4
            lea r11, [rip + syscall_return]
            push r11                      # return
            sti

            cmp rax, SYSCALL_COUNT
            jae bad_syscall

            lea r11, [rip + systable]
            jmp [r11 + 8*rax]

bad_syscall:
            mov rdi, rax
            mov rsi, [rbp + 8]
            jmp unknown_syscall

syscall_return:
            mov r11, [fs:tss@tpoff + 4]   # rsp0
            test qword ptr [r11], 0x2     # killed ?
            jz 1f
            call terminate

 1:         cli
            pop r11
            wrgsbase r11                  # restore gs
            pop r11
            wrfsbase r11                  # restore fs
            xor rdx, rdx
            xor rsi, rsi
            xor rdi, rdi
            xor r8, r8
            xor r9, r9
            xor r10, r10
            pop rbp
            pop rcx
            pop r11
            pop rsp
            sysretq

sys_process_create_wrapper:
            push r12
            call sys_process_create
            add rsp, 16
            jmp syscall_return

#syscall_7_wrapper:
#            push r12
#            call sys_test7
#            add rsp, 16
#            jmp syscall_return

#syscall_8_wrapper:
#            push r13
#            push r12
#            call sys_test8
#            add rsp, 24
#            jmp syscall_return

#syscall_9_wrapper:
#            push r14
#            push r13
#            push r12
#            call sys_test9
#            add rsp, 32
#            jmp syscall_return

#syscall_10_wrapper:
#            push r15
#            push r14
#            push r13
#            push r12
#            call sys$test10
#            add rsp, 40
#            jmp syscall_return

.section .note.GNU-stack, "", @progbits
