       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v3, #2
       movs    a1, #20
       sub    sp, sp, #80
       movs    v2, sp
       movs    a1, #1
       str     a1, [v2]
       add     a1, v2, #4
       movs    a2, #2
       str     a2, [a1]
       movs    v1, #0
.while_continue_1:
       mov     a1, v3
       mul     a1, a1, #4
       add     a2, v2, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       sub     a1, v3, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       add     a2, a2, a1
       sub     a1, v3, #2
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       add     v2, a2, a1
       mov     a1, v2
       str     a1, [a2]
       mov     a1, v3
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       add     v1, v1, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       add     v3, v3, #1
.while_break_1:
       mov     a1, v1
       pop     {r7, pc}
