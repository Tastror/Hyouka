       .text
       .global      main
main:
       movs    a1, #10
       div     a1, a1, #3
       bx      lr
