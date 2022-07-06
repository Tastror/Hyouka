       .text
       .global      main
reverse:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       b       .if_end_2
.if_wrong_1:
       bl      t_getint
       mov     a1, a1
       sub     a1, a1, #1
       bl      reverse
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
.if_end_2:
       movs    a1, #200
       mov     a1, a1
       bl      reverse
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #200
       mov     a1, a1
       bl      erse
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
