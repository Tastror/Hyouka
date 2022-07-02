ifElseIf:
       movs    v2, #5
       movs    v3, #10
       movs    a1, #1
       cmp     v2, #6
       bne     .temp_label_1
       cmp     v3, #11
       bne     .temp_label_1
       movs    a1, #0
       b       .if_end_3
.if_wrong_2:
       movs    a1, #0
       cmp     v3, #10
       bne     .temp_label_4
       cmp     v2, #1
       bne     .temp_label_4
       movs    a1, #1
       movs    v2, #25
       b       .if_end_6
.if_wrong_5:
       movs    a1, #0
       cmp     v3, #10
       bne     .temp_label_7
       cmp     v2, #-5
       bne     .temp_label_7
       movs    a1, #1
       add     v2, v2, #15
       b       .if_end_9
.if_wrong_8:
       sub     v2, no_name, v1
.if_end_9:
.if_end_6:
.if_end_3:
       mov     a1, v2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      ifElseIf
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
