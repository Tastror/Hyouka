       .text
       .global      main
main:
       movs    a1, #10
       mod     a1, a1, #3
       bx      lr
