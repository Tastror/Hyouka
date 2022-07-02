main:
       movs    a1, #4
       mul     a1, a1, #4
       movw    a2, #:lower16:a
       movt    a2, #:upper16:a
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
a:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
:
       .word    0
:
       .word    1
:
       .word    2
:
       .word    3
:
       .word    4
