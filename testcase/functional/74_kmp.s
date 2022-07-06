       .text
       .global      main
get_next:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       mov     a2, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, #-1
       str     a2, [a1]
       movs    a1, #0
       mov     a2, #-1
.while_continue_1:
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       cmp     a2, #-1
       bne     .temp_label_2
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bne     .temp_label_2
       movs    a1, #0
       add     a2, a2, #1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       b       .if_end_4
.if_wrong_3:
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
.if_end_4:
.while_break_1:
       mov     v3, a1
       mov     v7, a2
       sub    sp, sp, #16384
       movs    v6, sp
       mov     a1, v3
       mov     a2, v6
       bl      get_next
       mov     a1, a1
       movs    v4, #0
       movs    v5, #0
.while_continue_5:
       mov     a1, v5
       mul     a1, a1, #4
       add     a2, v7, a1
       ldr     a1, [a2]
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v7, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bne     .if_wrong_6
       add     v4, v4, #1
       add     v5, v5, #1
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
.if_end_8:
       b       .if_end_7
.if_wrong_6:
       mov     a1, v4
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #-1
       bne     .if_end_9
       add     v4, v4, #1
       add     v5, v5, #1
.if_end_9:
.if_end_7:
.while_break_5:
       mov     a1, #-1
       pop     {r7, pc}
KMP:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v3, a1
       mov     v7, a2
       sub    sp, sp, #16384
       movs    v6, sp
       mov     a1, v3
       mov     a2, v6
       bl      _next
       mov     a1, a1
       movs    v4, #0
       movs    v5, #0
.while_continue_5:
       mov     a1, v5
       mul     a1, a1, #4
       add     a2, v7, a1
       ldr     a1, [a2]
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v7, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bne     .if_wrong_6
       add     v4, v4, #1
       add     v5, v5, #1
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
.if_end_8:
       b       .if_end_7
.if_wrong_6:
       mov     a1, v4
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #-1
       bne     .if_end_9
       add     v4, v4, #1
       add     v5, v5, #1
.if_end_9:
.if_end_7:
.while_break_5:
       mov     a1, #-1
       pop     {r7, pc}
read_str:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       movs    a1, #0
.while_continue_10:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       bl      t_getch
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #10
       bne     .if_end_11
       b       .while_continue_10
.if_end_11:
       add     a1, a1, #1
.while_break_10:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #16384
       movs    a1, sp
       sub    sp, sp, #16384
       movs    a1, sp
       mov     a1, a1
       bl      read_str
       mov     a1, a1
       mov     a1, a1
       bl      read_str
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       bl      KMP
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
