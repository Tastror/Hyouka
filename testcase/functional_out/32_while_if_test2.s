ifWhile:
       movs    v1, #0
       movs    v2, #3
       cmp     v1, #5
       bne     .if_wrong_1
.while_continue_3:
       cmp     v2, #2
       bne     .while_break_3
       add     v2, v2, #2
.while_break_3:
       add     v2, v2, #25
       b       .if_end_2
.if_wrong_1:
.while_continue_4:
       cmp     v1, #5
       bge     .while_break_4
       mul     v2, v2, #2
       add     v1, v1, #1
.while_break_4:
.if_end_2:
       mov     a1, v2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      ifWhile
       mov     a1, a1
       pop     {r7, pc}
