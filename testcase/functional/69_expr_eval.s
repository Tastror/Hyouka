       .text
       .global      main
next_char:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getch
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
is_space:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       movs    a1, #1
       cmp     a1, #32
       bne     .temp_label_1
       cmp     a1, #10
       bne     .temp_label_1
       movs    a1, #0
       b       .if_end_3
.if_wrong_2:
.if_end_3:
       mov     a1, a1
       movs    a1, #0
       movs    a1, #1
       b       .if_end_6
.if_wrong_5:
.if_end_6:
.while_continue_7:
       mov     a1, a2
       bl      is_space
       mov     a1, a1
       bl      next_char
       mov     a1, a1
.while_break_7:
       mov     a1, a2
       bl      is_num
       mov     a1, a1
       movw    a2, #:lower16:last_char
       movt    a2, #:upper16:last_char
       ldr     a2, [a2]
       sub     a1, a2, #48
.while_continue_10:
       bl      next_char
       mov     a1, a1
       bl      is_num
       mov     a1, a1
       movw    a1, #:lower16:num
       movt    a1, #:upper16:num
       ldr     a1, [a1]
       mul     a1, a1, #10
       movw    a2, #:lower16:last_char
       movt    a2, #:upper16:last_char
       ldr     a2, [a2]
       add     a1, a1, a2
       sub     a1, a1, #48
.while_break_10:
       movs    a1, #0
       b       .if_end_9
.if_wrong_8:
       mov     a1, a2
       bl      next_char
       mov     a1, a1
       movs    a1, #1
.if_end_9:
       mov     a1, a1
       pop     {r7, pc}
is_num:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       movs    a1, #0
       movs    a1, #1
       b       .if_end_6
.if_wrong_5:
.if_end_6:
.while_continue_7:
       mov     a1, a2
       bl      space
       mov     a1, a1
       bl      t_char
       mov     a1, a1
.while_break_7:
       mov     a1, a2
       bl      num
       mov     a1, a1
       sub     a1, a2, #48
.while_continue_10:
       bl      t_char
       mov     a1, a1
       bl      num
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       sub     a1, a1, #48
.while_break_10:
       movs    a1, #0
       b       .if_end_9
.if_wrong_8:
       mov     a1, a2
       bl      t_char
       mov     a1, a1
       movs    a1, #1
.if_end_9:
       mov     a1, a1
       pop     {r7, pc}
next_token:
       push    {r7, lr}
       add     r7, sp, #0
.while_continue_7:
       mov     a1, a2
       bl      ce
       mov     a1, a1
       bl      har
       mov     a1, a1
.while_break_7:
       mov     a1, a2
       bl      
       mov     a1, a1
       sub     a1, a2, #48
.while_continue_10:
       bl      har
       mov     a1, a1
       bl      
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       sub     a1, a1, #48
.while_break_10:
       movs    a1, #0
       b       .if_end_9
.if_wrong_8:
       mov     a1, a2
       bl      har
       mov     a1, a1
       movs    a1, #1
.if_end_9:
       mov     a1, a1
       pop     {r7, pc}
panic:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #112
       bl      t_putch
       mov     a1, a1
       movs    a1, #97
       bl      t_putch
       mov     a1, a1
       movs    a1, #110
       bl      t_putch
       mov     a1, a1
       movs    a1, #105
       bl      t_putch
       mov     a1, a1
       movs    a1, #99
       bl      t_putch
       mov     a1, a1
       movs    a1, #33
       bl      t_putch
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       mov     a1, #-1
       pop     {r7, pc}
get_op_prec:
       mov     a1, a1
       movs    a1, #1
       cmp     a1, #43
       bne     .temp_label_11
       cmp     a1, #45
       bne     .temp_label_11
       movs    a1, #0
.if_end_12:
       movs    a1, #1
       movs    a1, #1
       cmp     a1, #42
       bne     .temp_label_14
       cmp     a1, #47
       bne     .temp_label_14
       movs    a1, #0
       cmp     a1, #37
       bne     .temp_label_13
       movs    a1, #0
.if_end_15:
       movs    a1, #0
       bx      lr
stack_push:
       mov     a2, a1
       mov     a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       bx      lr
stack_pop:
       mov     a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       bx      lr
stack_peek:
       mov     a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
stack_size:
       mov     a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
eval_op:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       cmp     a1, #43
       bne     .if_end_16
.if_end_16:
       cmp     a1, #45
       bne     .if_end_17
.if_end_17:
       cmp     a1, #42
       bne     .if_end_18
.if_end_18:
       cmp     a1, #47
       bne     .if_end_19
.if_end_19:
       cmp     a1, #37
       bne     .if_end_20
.if_end_20:
       movs    a1, #0
       bx      lr
eval:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #1024
       movs    v4, sp
       sub    sp, sp, #1024
       movs    v5, sp
.if_end_21:
       mov     a1, v4
       mov     a2, v2
       bl      stack_push
       mov     a1, a1
       bl      next_token
       mov     a1, a1
.while_continue_22:
       mov     v6, v3
       mov     a1, v6
       bl      get_op_prec
       mov     a1, a1
       b       .while_continue_22
.if_end_23:
       bl      next_token
       mov     a1, a1
.while_continue_24:
       movs    a1, #0
       mov     a1, v5
       bl      stack_size
       mov     a1, a1
       mov     a1, v5
       bl      stack_peek
       mov     a1, a1
       bl      get_op_prec
       mov     v1, a1
       mov     a1, v6
       bl      get_op_prec
       mov     a1, a1
       movs    a1, #1
       mov     a1, v5
       bl      stack_pop
       mov     v7, a1
       mov     a1, v4
       bl      stack_pop
       mov     spill, a1
       mov     a1, v4
       bl      stack_pop
       mov     a1, a1
       mov     a1, v4
       mov     a1, v7
       mov     a2, a1
       mov     a3, spill
       bl      eval_op
       mov     a2, a1
       bl      stack_push
       mov     a1, a1
.while_break_24:
       mov     a1, v5
       mov     a2, v6
       bl      stack_push
       mov     a1, a1
.if_end_26:
       mov     a1, v4
       mov     a2, v2
       bl      stack_push
       mov     a1, a1
       bl      next_token
       mov     a1, a1
.while_break_22:
       bl      next_token
       mov     a1, a1
.while_continue_27:
       mov     a1, v5
       bl      stack_size
       mov     a1, a1
       mov     a1, v5
       bl      stack_pop
       mov     spill, a1
       mov     a1, v4
       bl      stack_pop
       mov     spill, a1
       mov     a1, v4
       bl      stack_pop
       mov     a1, a1
       mov     a1, v4
       mov     a1, spill
       mov     a2, a1
       mov     a3, spill
       bl      eval_op
       mov     a2, a1
       bl      stack_push
       mov     a1, a1
.while_break_27:
       mov     a1, v4
       bl      stack_peek
       mov     a1, a1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     a1, a1
       bl      t_getch
       mov     a1, a1
       bl      next_token
       mov     a1, a1
.while_continue_28:
       bl      eval
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       sub     a1, a1, #1
.while_break_28:
       movs    a1, #0
       pop     {r7, pc}
TOKEN_NUM:
       .word    0
TOKEN_OTHER:
       .word    1
last_char:
       .word    32
num:
       .word    0
other:
       .word    0
cur_token:
       .word    0
