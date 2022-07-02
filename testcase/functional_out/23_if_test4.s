if_ifElse_:
       movs    v1, #5
       movs    v2, #10
       cmp     v1, #5
       bne     .if_end_1
       cmp     v2, #10
       bne     .if_wrong_2
       movs    v1, #25
       b       .if_end_3
.if_wrong_2:
       add     v1, v1, #15
.if_end_3:
.if_end_1:
       mov     a1, v1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      if_ifElse_
       mov     a1, a1
       pop     {r7, pc}
