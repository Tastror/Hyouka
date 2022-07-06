       .text
       .global      main
defn:
       movs    a1, #4
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      defn
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
