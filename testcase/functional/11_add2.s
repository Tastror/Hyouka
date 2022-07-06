       .text
       .global      main
main:
       movs    a1, #10
       mov     a2, #-1
       add     a1, a1, a2
       bx      lr
