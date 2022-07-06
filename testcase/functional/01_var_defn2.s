       .text
       .global      main
main:
       movs    a2, #5
       movw    a1, #:lower16:b
       movt    a1, #:upper16:b
       ldr     a1, [a1]
       add     a1, a2, a1
       bx      lr
a:
       .word    3
b:
       .word    5
