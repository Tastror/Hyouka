FourWhile:
       movs    v1, #5
       movs    v2, #6
       movs    v3, #7
       movs    v4, #10
.while_continue_1:
       cmp     v1, #20
       bge     .while_break_1
       add     v1, v1, #3
.while_continue_2:
       cmp     v2, #10
       bge     .while_break_2
       add     v2, v2, #1
.while_continue_3:
       cmp     v3, #7
       bne     .while_break_3
       sub     v3, v3, #1
.while_continue_4:
       cmp     v4, #20
       bge     .while_break_4
       add     v4, v4, #3
.while_break_4:
       sub     v4, v4, #1
.while_break_3:
       add     v3, v3, #1
.while_break_2:
       sub     v2, v2, #2
.while_break_1:
       add     a1, v2, v4
       add     a1, v1, a1
       add     a1, a1, v3
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      FourWhile
       mov     a1, a1
       pop     {r7, pc}
