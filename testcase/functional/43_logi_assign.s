       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     v1, a1
       bl      t_getint
       mov     a1, a1
       movs    a1, #0
       cmp     v1, a1
       bne     .temp_label_1
       movs    a1, #1
       movs    a1, #1
       b       .if_end_3
.if_wrong_2:
       movs    a1, #0
.if_end_3:
       mov     a1, a1
       pop     {r7, pc}
a:
       .word    0
b:
       .word    0
