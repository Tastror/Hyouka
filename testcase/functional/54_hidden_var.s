       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v5, #1
       movs    v6, #2
       movs    v6, #3
       mov     a1, v6
       bl      t_putint
       mov     a1, a1
       mov     a1, v6
       bl      t_putint
       mov     a1, a1
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.while_continue_1:
       cmp     v5, #5
       bge     .while_break_1
       movs    a1, #0
       add     a1, a1, #1
       b       .while_continue_1
.if_end_2:
.while_break_1:
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a1, v2, a1
       movs    a2, #1
       str     a2, [a1]
       sub    sp, sp, #64
       movs    v7, sp
       movs    a1, #0
       str     a1, [v7]
       add     a1, v7, #4
       movs    a2, #9
       str     a2, [a1]
       add     a1, v7, #12
       movs    a2, #8
       str     a2, [a1]
       add     a1, v7, #16
       movs    a2, #3
       str     a2, [a1]
       movs    v3, #2
       movs    a1, #2
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       sub    sp, sp, #140
       movs    v4, sp
       add     a1, v4, #40
       movs    a2, #2
       str     a2, [a1]
       add     a1, v4, #44
       movs    a2, #1
       str     a2, [a1]
       add     a1, v4, #48
       movs    a2, #8
       str     a2, [a1]
       mov     a1, v3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       mov     a1, v3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       mov     a1, v3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
.if_end_3:
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #1
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #3
       mul     a1, a1, #4
       movw    v2, #:lower16:c
       movt    v2, #:upper16:c
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
b:
       .word    5
c:
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
:
       .word    6
:
       .word    7
:
       .word    8
:
       .word    9
