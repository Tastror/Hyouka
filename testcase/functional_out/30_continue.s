main:
       movs    v1, #0
       movs    v2, #0
.while_continue_1:
       cmp     v1, #100
       bge     .while_break_1
       cmp     v1, #50
       bne     .if_end_2
       add     v1, v1, #1
       b       .while_break_1
.if_end_2:
       add     v2, v2, v1
       add     v1, v1, #1
.while_break_1:
       mov     a1, v2
       bx      lr
