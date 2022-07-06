       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     spill, a1
.while_continue_1:
       cmp     spill, #5
       bne     .while_break_1
       add     spill, spill, #1
.while_break_1:
       movs    a1, #0
       add     v1, a1, #1
       add     spill, v1, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     v2, spill, #1
       add     v3, v2, #1
       add     v4, v3, #1
       add     v5, v4, #1
       add     v6, v5, #1
       add     v7, v6, #1
       add     spill, v7, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       add     spill, spill, #1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, v2
       bl      t_putint
       mov     a1, a1
       mov     a1, v3
       bl      t_putint
       mov     a1, a1
       mov     a1, v4
       bl      t_putint
       mov     a1, a1
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       mov     a1, v6
       bl      t_putint
       mov     a1, a1
       mov     a1, v7
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       movs    spill, #10
       mov     a1, spill
       bl      t_putch
       mov     a1, a1
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       bl      t_putch
       mov     a1, a1
       mov     a1, spill
       pop     {r7, pc}
n:
       .word    0
