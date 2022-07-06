       .text
       .global      main
main:
       movs    v2, #0
       movs    v3, #0
.while_continue_1:
       cmp     v2, #6
       bge     .while_break_1
       mov     a1, v2
       mul     a1, a1, #4
       movw    v1, #:lower16:arr
       movt    v1, #:upper16:arr
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       add     v3, v3, a2
       add     v2, v2, #1
.while_break_1:
       mov     a1, v3
       bx      lr
N:
       .word    -1
arr:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
:
       .word    1
:
       .word    2
:
       .word    33
:
       .word    4
:
       .word    5
:
       .word    6
