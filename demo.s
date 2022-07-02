main:
       push    {r3, lr}
       movs    a1, #1
       movs    a2, #2
       movs    a3, #3
       bl      t_putint
       mov     a1, a1
