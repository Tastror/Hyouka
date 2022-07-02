main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #400
       movs    v1, sp
       movs    v2, #0
       movs    v3, #0
.while_continue_1:
       bl      t_getint
       mov     a1, a1
       mov     a1, v2
       mul     a1, a1, #4
       add     v1, v1, a1
       bl      t_getint
       mov     v1, a1
       mov     a1, v1
       str     a1, [v1]
       add     v2, v2, #1
.while_break_1:
.while_continue_2:
       sub     v2, v2, #1
       mov     a1, v2
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a1, [a2]
       add     v3, v3, a1
.while_break_2:
       mod     a1, v3, #79
       pop     {r7, pc}
