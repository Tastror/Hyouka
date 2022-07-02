main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v1, #3389
       cmp     v1, #10000
       bge     .if_end_1
       movw    v1, #:lower16:k
       movt    v1, #:upper16:k
       ldr     v1, [v1]
       add     v1, v1, #1
       movs    v2, #112
.while_continue_2:
       sub     v2, v2, #88
       cmp     v2, #1000
       bge     .if_end_3
       movs    a1, #9
       movs    a2, #11
       movs    a1, #10
       sub     v2, v2, a1
       movs    a1, #11
       add     a1, v2, a1
       add     v2, a1, a2
.if_end_3:
.while_break_2:
       mov     a1, v2
       bl      t_putint
       mov     a1, a1
.if_end_1:
       mov     a1, v1
       pop     {r7, pc}
k:
       .word    0
