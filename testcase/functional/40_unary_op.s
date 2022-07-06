       .text
       .global      main
main:
       movs    a1, #10
       sub     a1, no_name, a1
       mov     a1, #-1
       b       .if_end_2
.if_wrong_1:
       movs    a1, #0
.if_end_2:
       mov     a1, a1
       bx      lr
