       .text
       .global      main
my_getint:
       movs    a1, #0
.while_continue_1:
       mvn     a2, #47
       movs    a1, #1
       cmp     a2, #0
       bge     .temp_label_2
       movs    a1, #0
       b       .while_break_1
       b       .if_end_4
.if_wrong_3:
       b       .while_continue_1
.if_end_4:
.while_break_1:
       mov     a1, a2
.while_continue_5:
       mvn     a2, #47
       movs    a1, #0
       movs    a1, #1
       mul     a1, a1, #10
       add     a1, a1, a2
       b       .if_end_8
.if_wrong_7:
       b       .while_continue_5
.if_end_8:
.while_break_5:
       mov     a1, a1
       bx      lr
my_putint:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       sub    sp, sp, #64
       movs    a2, sp
       movs    a1, #0
.while_continue_9:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #48
       str     a2, [a1]
       div     a1, a1, #10
       add     a1, a1, #1
.while_break_9:
.while_continue_10:
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putch
       mov     a1, a1
.while_break_10:
       bl      my_getint
       mov     v1, a1
.while_continue_11:
       bl      my_getint
       mov     a1, a1
       mov     a1, a1
       bl      my_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       sub     v1, v1, #1
.while_break_11:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      getint
       mov     v1, a1
.while_continue_11:
       bl      getint
       mov     a1, a1
       mov     a1, a1
       bl      putint
       mov     a1, a1
       movs    a1, #10
       bl      utch
       mov     a1, a1
       sub     v1, v1, #1
.while_break_11:
       movs    a1, #0
       pop     {r7, pc}
ascii_0:
       .word    48
