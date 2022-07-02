exgcd:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v4, a1
       mov     v5, a2
       mov     v6, a3
       mov     v7, a4
       cmp     v5, #0
       bne     .if_wrong_1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v6, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v7, a1
       movs    a2, #0
       str     a2, [a1]
       b       .if_end_2
.if_wrong_1:
       mov     a1, v5
       mod     a2, v4, v5
       mov     a3, v6
       mov     a4, v7
       bl      exgcd
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v6, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v7, a1
       ldr     v6, [a1]
       mov     a2, v6
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v7, a1
       div     a1, v4, v5
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v7, a1
       ldr     a2, [a1]
       mul     a1, a1, a2
       sub     v7, a2, a1
       mov     a2, v7
       str     a2, [a1]
.if_end_2:
       movs    a1, #7
       movs    a2, #15
       sub    sp, sp, #4
       movs    a2, sp
       movs    a1, #1
       str     a1, [a2]
       sub    sp, sp, #4
       movs    a2, sp
       movs    a1, #1
       str     a1, [a2]
       mov     a1, a1
       mov     a2, a2
       mov     a3, a2
       mov     a4, a2
       bl      exgcd
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mod     a1, a1, a2
       add     a1, a1, a2
       mod     a2, a1, a2
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #7
       movs    a2, #15
       sub    sp, sp, #4
       movs    a2, sp
       movs    a1, #1
       str     a1, [a2]
       sub    sp, sp, #4
       movs    a2, sp
       movs    a1, #1
       str     a1, [a2]
       mov     a1, a1
       mov     a2, a2
       mov     a3, a2
       mov     a4, a2
       bl      cd
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mod     a1, a1, a2
       add     a1, a1, a2
       mod     a2, a1, a2
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      utint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
