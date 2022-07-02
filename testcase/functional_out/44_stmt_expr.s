main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v2, #0
       movs    v1, #1
.while_continue_1:
       add     v2, v2, #1
       movw    v1, #:lower16:k
       movt    v1, #:upper16:k
       ldr     v1, [v1]
       add     a1, v1, #1
       movw    v1, #:lower16:k
       movt    v1, #:upper16:k
       ldr     v1, [v1]
       movw    v1, #:lower16:k
       movt    v1, #:upper16:k
       ldr     v1, [v1]
       add     v1, v1, v1
.while_break_1:
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       mov     a1, v1
       pop     {r7, pc}
k:
       .word    0
n:
       .word    10
