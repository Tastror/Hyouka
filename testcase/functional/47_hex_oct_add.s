       .text
       .global      main
main:
       movs    a1, #15
       movs    a2, #12
       add     a1, a1, a2
       add     a1, a1, #61
       bx      lr
