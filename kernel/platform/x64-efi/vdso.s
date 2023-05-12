#
# vdso
#

.intel_syntax noprefix

              # syscall number - rax
              # arg 1  - rdi
              # arg 2  - rsi
              # arg 3  - rdx
              # arg 4  - rcx into r10
              # arg 5  - r8
              # arg 6  - r9
              # arg 7  - [rsp + 8] into saved r12
              # arg 8  - [rsp + 16] into saved r13
              # arg 9  - [rsp + 24] into saved r14
              # arg 10 - [rsp + 32] into saved r15

.code64
              .global __vdso_thread_exit
              .global __vdso_process_exit
              .global __vdso_get_pagesize
              .global __vdso_mmap
              .global __vdso_munmap
              .global __vdso_ioring_setup
              .global __vdso_ioring_enter
              .global __vdso_clock_res
              .global __vdso_clock_time
              .global __vdso_get_pid
              .global __vdso_get_tid
              .global __vdso_get_uid
              .global __vdso_get_euid
              .global __vdso_get_gid
              .global __vdso_get_egid
              .global __vdso_process_create
              .global __vdso_process_kill
              .global __vdso_thread_create
              .global __vdso_wait

              .section .rodata

page_size:    .quad 4096
clock_base:   .quad 0
clock_scale:  .quad 1

              .section .text

__vdso_thread_exit:
              mov rax, 0
              syscall
              ret

__vdso_process_exit: # i32 rval
              mov rax, 1
              syscall
              ret

__vdso_get_pagesize:
              mov rax, [rip + page_size]
              ret

__vdso_mmap: # i32 fd, mmvec *mmvs, usize n, void mut * mut *addrbuf, u64 flags
              mov rax, 3
              mov r10, rcx
              syscall
              ret

__vdso_munmap: # void *addr, usize length
              mov rax, 4
              syscall
              ret

__vdso_ioring_setup: # void *buffer, usize bufferlen, u64 flags
              mov rax, 5
              syscall
              ret

__vdso_ioring_enter: # i32 fd, u32 to_submit, u32 min_complete, u64 flags
              mov rax, 6
              mov r10, rcx
              syscall
              ret

__vdso_clock_res: # i32 clockid, u64 mut *res
              mov rax, 7
              syscall
              ret

__vdso_clock_time: # i32 clockid, u64 mut *tp
              rdtsc
              shl rdx, 32
              or rax, rdx
              mov rcx, [rip + clock_scale]
              mul rcx
              cmp rdi, 0
              jne .L1
              mov rcx, [rip + clock_base]
              add rdx, rcx
              jmp .L3
 .L1:         cmp rdi, 1
              jne .L2
              jmp .L3
 .L2:         mov rax, -22
              ret
 .L3:         mov [rsi], rdx
              mov rax, 0
              ret

__vdso_get_pid:
              mov rax, 9
              syscall
              ret

__vdso_get_tid:
              mov rax, 10
              syscall
              ret

__vdso_get_uid:
              mov rax, 11
              syscall
              ret

__vdso_get_euid:
              mov rax, 12
              syscall
              ret

__vdso_get_gid:
              mov rax, 13
              syscall
              ret

__vdso_get_egid:
              mov rax, 14
              syscall
              ret

__vdso_process_create: # arg *argv, usize argc, arg *envp, usize envc, attr *attrs, usize n, u64 flags
              push rbp
              mov rbp, rsp
              push r12
              mov rax, 15
              mov r10, rcx
              mov r12, [rbp + 0x10]
              syscall
              pop r12
              pop rbp
              ret

__vdso_process_kill: # pid
              mov rax, 16
              syscall
              ret

__vdso_thread_create: # void *entry, void *parameter, u64 flags
              mov rax, 17
              syscall
              ret

__vdso_wait: # i32 id, i32 mut *rvalbuf, u64 flags
              mov rax, 18
              syscall
              ret
