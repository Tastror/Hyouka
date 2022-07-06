       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v1, #5
       movs    v2, #5
       movs    v3, #1
       mvn     v4, #1
       movs    v5, #2
       movs    a1, #1
       mul     a1, v4, #1
       div     a1, a1, #2
       cmp     a1, #0
       bge     .temp_label_1
       movs    a1, #0
       sub     a1, v1, v2
       add     a1, v3, #3
       mod     a1, a1, #2
       movs    a1, #1
       movs    a1, #0
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
.if_end_3:
       movs    a1, #1
       mod     a1, v4, #2
       add     a1, a1, #67
       cmp     a1, #0
       bge     .temp_label_4
       movs    a1, #0
       sub     a1, v1, v2
       add     a1, v3, #2
       mod     a1, a1, #2
       movs    a1, #1
       movs    a1, #0
       movs    v5, #4
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
.if_end_6:
       movs    a1, #0
       pop     {r7, pc}
