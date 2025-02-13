#
# check.s
#

.intel_syntax noprefix

.code64

            .global __null_chk_fail
            .global __div0_chk_fail
            .global __carry_chk_fail
            .global __stack_chk_fail

__null_chk_fail:
            int 3
            jmp exit

__div0_chk_fail:
            int 3
            jmp exit

__carry_chk_fail:
            int 3
            jmp exit

__stack_chk_fail:
            int 3
            jmp exit

.section .note.GNU-stack, "", @progbits
