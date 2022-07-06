       .text
       .global      main
main:
       movs    a1, #10
       movs    a1, #4
       movs    a2, #2
       movs    a2, #2
       add     a1, a2, a1
       sub     a2, a1, a2
       mul     a1, a1, a2
       bx      lr
