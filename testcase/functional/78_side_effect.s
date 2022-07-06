       .text
       .global      main
inc_a:
       mov     a1, a1
       add     a1, a1, #1
       mov     a1, a1
       mov     a1, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #5
.while_continue_1:
       movs    a1, #0
       movs    a1, #0
       bl      inc_a
       mov     a1, a1
       bl      inc_a
       mov     a1, a1
       movs    a1, #1
       bl      inc_a
       mov     a1, a1
       movs    a1, #1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.if_end_4:
       movs    a1, #1
       bl      inc_a
       mov     a1, a1
       cmp     a1, #14
       bge     .temp_label_5
       movs    a1, #0
       bl      inc_a
       mov     a1, a1
       bl      inc_a
       mov     a1, a1
       bl      inc_a
       mov     a2, a1
       sub     a1, a1, a2
       add     a1, a1, #1
       movs    a1, #1
       movs    a1, #0
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movw    a1, #:lower16:b
       movt    a1, #:upper16:b
       ldr     a1, [a1]
       mul     a1, a1, #2
       b       .if_end_8
.if_wrong_7:
       bl      inc_a
       mov     a1, a1
.if_end_8:
       sub     a1, a1, #1
.while_break_1:
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
a:
       .word    -1
b:
       .word    1
