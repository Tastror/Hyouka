       .text
       .global      main
move:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #44
       bl      t_putch
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     v4, a1
       mov     v5, a2
       mov     v7, a3
       mov     v6, a4
       cmp     v4, #1
       bne     .if_wrong_1
       mov     a1, v5
       mov     a2, v6
       bl      move
       mov     a1, a1
       b       .if_end_2
.if_wrong_1:
       sub     a1, v4, #1
       mov     a2, v5
       mov     a3, v6
       mov     a4, v7
       bl      hanoi
       mov     a1, a1
       mov     a1, v5
       mov     a2, v6
       bl      move
       mov     a1, a1
       sub     a1, v4, #1
       mov     a2, v7
       mov     a3, v5
       mov     a4, v6
       bl      hanoi
       mov     a1, a1
.if_end_2:
       bl      t_getint
       mov     a1, a1
.while_continue_3:
       bl      t_getint
       mov     a1, a1
       movs    a2, #1
       movs    a3, #2
       movs    a4, #3
       bl      hanoi
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       sub     a1, a1, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
hanoi:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v4, a1
       mov     v5, a2
       mov     v7, a3
       mov     v6, a4
       cmp     v4, #1
       bne     .if_wrong_1
       mov     a1, v5
       mov     a2, v6
       bl      e
       mov     a1, a1
       b       .if_end_2
.if_wrong_1:
       sub     a1, v4, #1
       mov     a2, v5
       mov     a3, v6
       mov     a4, v7
       bl      oi
       mov     a1, a1
       mov     a1, v5
       mov     a2, v6
       bl      e
       mov     a1, a1
       sub     a1, v4, #1
       mov     a2, v7
       mov     a3, v5
       mov     a4, v6
       bl      oi
       mov     a1, a1
.if_end_2:
       bl      etint
       mov     a1, a1
.while_continue_3:
       bl      etint
       mov     a1, a1
       movs    a2, #1
       movs    a3, #2
       movs    a4, #3
       bl      oi
       mov     a1, a1
       movs    a1, #10
       bl      utch
       mov     a1, a1
       sub     a1, a1, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      nt
       mov     a1, a1
.while_continue_3:
       bl      nt
       mov     a1, a1
       movs    a2, #1
       movs    a3, #2
       movs    a4, #3
       bl      
       mov     a1, a1
       movs    a1, #10
       bl      h
       mov     a1, a1
       sub     a1, a1, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
