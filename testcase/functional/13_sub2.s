       .text
       .global      main
main:
       movs    a1, #2
       mvn     a1, #9
       bx      lr
a:
       .word    10
