       .text
       .global      main
add:
       mov     spill, a1
       mov     spill, a2
       mov     spill, a3
       mov     spill, a4
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_1:
       cmp     spill, spill
       bge     .while_break_1
       mov     a1, spill
       mul     a1, a1, #4
       add     a2, spill, a1
       mov     a1, spill
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a1, spill
       str     a1, [a2]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mov     a1, spill
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mov     a1, spill
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a2, spill
       str     a2, [a1]
       add     spill, spill, #1
.while_break_1:
       movs    a1, #0
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #3
       movs    a1, #3
       movs    a1, #3
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #24
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       sub    sp, sp, #12
       movs    a2, sp
       movs    a2, #0
.while_continue_2:
       cmp     a2, a1
       bge     .while_break_2
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_2:
       mov     a1, a2
       mov     a2, a2
       mov     a3, a2
       mov     a4, a2
       mov     spill, a2
       mov     spill, a2
       mov     spill, a2
       mov     spill, a2
       mov     spill, a2
       bl      add
       mov     a2, a1
.while_continue_3:
       cmp     a2, a1
       bge     .while_break_3
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a2, a2, #1
.while_break_3:
       movs    a2, #10
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
       movs    a2, #0
.while_continue_4:
       cmp     a2, a1
       bge     .while_break_4
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a2, a2, #1
.while_break_4:
       movs    a2, #10
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
       movs    a2, #0
.while_continue_5:
       cmp     a2, a1
       bge     .while_break_5
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a2, a2, #1
.while_break_5:
       movs    a2, #10
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
M:
       .word    0
L:
       .word    0
N:
       .word    0
