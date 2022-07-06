       .text
       .global      main
func:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       movs    a1, #1
       cmp     a1, a2
       bne     .if_wrong_1
       add     a1, a1, #1
       b       .if_end_2
.if_wrong_1:
.if_end_2:
       movs    a1, #0
       movs    a1, #0
.while_continue_3:
       cmp     a1, #100
       bge     .while_break_3
       bl      func
       mov     a1, a1
       cmp     a1, #1
       bne     .if_end_4
       add     a1, a1, #1
.if_end_4:
       add     a1, a1, #1
.while_break_3:
       cmp     a1, #100
       bge     .if_wrong_5
       movs    a1, #1
       bl      t_putint
       mov     a1, a1
       b       .if_end_6
.if_wrong_5:
       movs    a1, #0
       bl      t_putint
       mov     a1, a1
.if_end_6:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #0
       movs    a1, #0
.while_continue_3:
       cmp     a1, #100
       bge     .while_break_3
       bl      c
       mov     a1, a1
       cmp     a1, #1
       bne     .if_end_4
       add     a1, a1, #1
.if_end_4:
       add     a1, a1, #1
.while_break_3:
       cmp     a1, #100
       bge     .if_wrong_5
       movs    a1, #1
       bl      utint
       mov     a1, a1
       b       .if_end_6
.if_wrong_5:
       movs    a1, #0
       bl      utint
       mov     a1, a1
.if_end_6:
       movs    a1, #0
       pop     {r7, pc}
a:
       .word    7
