f1:
       mov     a2, a1
       movs    a1, #5
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a1, v2, a1
       movs    a2, #4000
       str     a2, [a1]
       movs    a1, #4000
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a1, v2, a1
       movs    a2, #3
       str     a2, [a1]
       movs    a1, #4095
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a1, v2, a1
       movs    a2, #7
       str     a2, [a1]
       movs    a1, #4095
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #2216
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       add     a2, a1, #9
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #5
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       movw    v2, #:lower16:a
       movt    v2, #:upper16:a
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #16384
       movs    a1, sp
       add     a1, a1, #4096
       movs    a2, #1
       str     a2, [a1]
       add     a1, a1, #8192
       movs    a2, #2
       str     a2, [a1]
       add     a1, a1, #8196
       movs    a2, #3
       str     a2, [a1]
       add     a1, a1, #12288
       movs    a2, #4
       str     a2, [a1]
       add     a1, a1, #12292
       movs    a2, #5
       str     a2, [a1]
       add     a1, a1, #12296
       movs    a2, #6
       str     a2, [a1]
       sub    sp, sp, #16384
       movs    a2, sp
       movs    a1, #1
       str     a1, [a2]
       add     a1, a2, #4
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #16
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #20
       movs    a2, #4
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      f1
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       pop     {r7, pc}
a:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
