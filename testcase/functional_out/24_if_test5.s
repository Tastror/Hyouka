if_if_Else:
       movs    v1, #5
       movs    v2, #10
       cmp     v1, #5
       bne     .if_wrong_1
       cmp     v2, #10
       bne     .if_end_3
       movs    v1, #25
.if_end_3:
       b       .if_end_2
.if_wrong_1:
       add     v1, v1, #15
.if_end_2:
       mov     a1, v1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      if_if_Else
       mov     a1, a1
       pop     {r7, pc}
