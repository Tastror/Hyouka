set_a:
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bx      lr
set_b:
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bx      lr
set_d:
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v2, #2
       movs    v3, #3
       movs    a1, #0
       movs    a1, #0
       bl      set_a
       mov     a1, a1
       movs    a1, #1
       bl      set_b
       mov     a1, a1
       movs    a1, #1
.if_end_2:
       mov     a1, v2
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     a1, v3
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       movs    v2, #2
       movs    v3, #3
       movs    a1, #0
       movs    a1, #0
       bl      set_a
       mov     a1, a1
       movs    a1, #1
       bl      set_b
       mov     a1, a1
       movs    a1, #1
.if_end_4:
       mov     a1, v2
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       mov     a1, v3
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #1
       movs    v3, #2
       movs    a1, #0
       movs    a1, #3
       bl      set_d
       mov     a1, a1
       movs    a1, #1
.if_end_6:
       mov     a1, v3
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       movs    a1, #1
       movs    a1, #4
       bl      set_d
       mov     a1, a1
       movs    a1, #0
.if_end_8:
       mov     a1, v3
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #65
       bl      t_putch
       mov     a1, a1
.if_end_9:
       movs    a1, #66
       bl      t_putch
       mov     a1, a1
.if_end_10:
       movs    a1, #67
       bl      t_putch
       mov     a1, a1
.if_end_11:
       movs    a1, #68
       bl      t_putch
       mov     a1, a1
.if_end_12:
       movs    a1, #69
       bl      t_putch
       mov     a1, a1
.if_end_13:
       movs    a1, #70
       bl      t_putch
       mov     a1, a1
.if_end_14:
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    v3, #0
       movs    v4, #1
       movs    v5, #2
       movs    v6, #3
       movs    v7, #4
.while_continue_15:
       movs    a1, #0
       movs    a1, #1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
.while_break_15:
       movs    a1, #1
       movs    a1, #0
       movs    a1, #67
       bl      t_putch
       mov     a1, a1
.if_end_18:
       movs    a1, #1
       movs    a1, #0
       movs    a1, #72
       bl      t_putch
       mov     a1, a1
.if_end_20:
       movs    a1, #0
       movs    a1, #1
       movs    a1, #73
       bl      t_putch
       mov     a1, a1
.if_end_22:
       movs    a1, #1
       movs    a1, #0
       cmp     v3, a1
       bne     .temp_label_24
       cmp     v6, v6
       bge     .temp_label_24
       movs    a1, #1
       movs    a1, #0
       movs    a1, #74
       bl      t_putch
       mov     a1, a1
.if_end_25:
       movs    a1, #1
       cmp     v3, a1
       bne     .temp_label_26
       movs    a1, #0
       cmp     v6, v6
       bge     .temp_label_27
       movs    a1, #1
       movs    a1, #0
       movs    a1, #75
       bl      t_putch
       mov     a1, a1
.if_end_28:
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
a:
       .word    0
b:
       .word    0
d:
       .word    0
