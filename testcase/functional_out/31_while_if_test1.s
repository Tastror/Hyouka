whileIf:
       movs    a1, #0
       movs    a1, #0
.while_continue_1:
       cmp     a1, #100
       bge     .while_break_1
       cmp     a1, #5
       bne     .if_wrong_2
       movs    a1, #25
       b       .if_end_3
.if_wrong_2:
       cmp     a1, #10
       bne     .if_wrong_4
       movs    a1, #42
       b       .if_end_5
.if_wrong_4:
       mul     a1, a1, #2
.if_end_5:
.if_end_3:
       add     a1, a1, #1
.while_break_1:
       mov     a1, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      whileIf
       mov     a1, a1
       pop     {r7, pc}
