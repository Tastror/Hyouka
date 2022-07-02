main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v1, #5
       movs    v2, #5
       movs    v3, #1
       mvn     v4, #1
       mul     a1, v4, #1
       div     a1, a1, #2
       sub     a2, v1, v2
       add     a1, a1, a2
       add     a1, v3, #3
       sub     a1, no_name, a1
       mod     a2, a1, #2
       sub     a1, a1, a2
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       mod     a1, v4, #2
       add     a1, a1, #67
       sub     a1, v1, v2
       sub     a2, no_name, a1
       add     a2, a1, a2
       add     a1, v3, #2
       mod     a1, a1, #2
       sub     a1, no_name, a1
       sub     a1, a2, a1
       add     a1, a1, #3
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
