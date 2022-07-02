main:
       movs    a1, #10
       movs    a2, #30
       sub     a1, a1, #-5
       add     a1, a1, a2
       add     a1, a1, #-5
       bx      lr
