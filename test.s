k:
       .word    100
g:
       .word    2.981000
aa:
fun:
       push     {r7}
       add     r7, sp, #0
       mov     a1, #-1
       str     r3, [r7, #4]
       movs     r3, #0
       mov     r0, r3
       mov     sp, r7
       ldr     r7, [sp], #4
       bx     lr
main:
       push     {r7, lr}
       add     r7, sp, #0
       b      fun
       movs     a1, #0
       str     r3, [r7, #4]
       movs     r3, #2000
       mov     r0, r3
       mov     sp, r7
       ldr     r7, [sp], #4
       pop     {r7, lr}
