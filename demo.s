main:
       push    {r3, lr}
       movs    a1, #1
       movs    a2, #2
       movs    a3, #3
       bl      t_putint
       mov     a1, a1
       movs    a1, #15
       mov     a1, a1
       pop     {r3, pc}
