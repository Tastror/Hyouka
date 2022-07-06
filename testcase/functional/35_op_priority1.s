       .text
       .global      main
main:
       movs    a1, #10
       movs    a2, #4
       movs    a2, #2
       movs    a2, #2
       mul     a1, a1, a2
       add     a1, a2, a1
       sub     a1, a1, a2
       bx      lr
