func:
       mov     a1, a1
       sub     a1, a1, #1
       mov     a1, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #10
       mov     a1, a1
       bl      func
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
a:
       .word    0
