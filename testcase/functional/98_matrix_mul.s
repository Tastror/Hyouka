       .text
       .global      main
mul:
       mov     a2, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       movs    a1, #0
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       str     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v2, #3
       movs    v1, #3
       movs    a1, #3
       sub    sp, sp, #12
       movs    v3, sp
       sub    sp, sp, #12
       movs    v4, sp
       sub    sp, sp, #12
       movs    v5, sp
       sub    sp, sp, #12
       movs    v6, sp
       sub    sp, sp, #12
       movs    v7, sp
       sub    sp, sp, #12
       movs    spill, sp
       sub    sp, sp, #24
       movs    spill, sp
       sub    sp, sp, #12
       movs    spill, sp
       sub    sp, sp, #12
       movs    spill, sp
       movs    spill, #0
.while_continue_1:
       cmp     spill, v1
       bge     .while_break_1
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, v4, a1
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, v5, a1
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, v6, a1
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, v7, a1
       mov     a2, spill
       str     a2, [a1]
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mov     a2, spill
       str     a2, [a1]
       add     spill, spill, #1
.while_break_1:
       mov     a1, v3
       mov     a2, v4
       mov     a3, v5
       mov     a4, v6
       mov     spill, v7
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       bl      mul
       mov     spill, a1
.while_continue_2:
       cmp     spill, v2
       bge     .while_break_2
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     spill, spill, #1
.while_break_2:
       movs    a2, #10
       movs    spill, #0
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
.while_continue_3:
       cmp     spill, v2
       bge     .while_break_3
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     spill, spill, #1
.while_break_3:
       movs    a2, #10
       movs    spill, #0
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
.while_continue_4:
       cmp     spill, v2
       bge     .while_break_4
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     spill, spill, #1
.while_break_4:
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
