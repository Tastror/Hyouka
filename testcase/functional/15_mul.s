       .text
       .global      main
main:
       movs    a1, #10
       movs    a2, #5
       mul     a1, a1, a2
       bx      lr
