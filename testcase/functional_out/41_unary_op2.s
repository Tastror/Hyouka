main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v2, #56
       movs    a1, #4
       sub     a1, v2, #-4
       add     v2, a1, v2
       sub     a1, no_name, a1
       mov     v2, #-1
       b       .if_end_2
.if_wrong_1:
       add     v2, no_name, v2
.if_end_2:
       mov     a1, v2
       bl      t_putint
       mov     v2, a1
       movs    a1, #0
       pop     {r7, pc}
