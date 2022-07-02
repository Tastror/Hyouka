swap:
       mov     a2, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       mov     a1, a2
       str     a1, [a2]
       movs    a1, #0
       bx      lr
heap_ajust:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v3, a1
       mov     a1, a2
       mov     v5, a3
       mov     v4, a1
       mul     a1, v4, #2
       add     v6, a1, #1
.while_continue_1:
       add     a1, v5, #1
       cmp     v6, a1
       bge     .while_break_1
       movs    a1, #0
       cmp     v6, v5
       bge     .temp_label_2
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       add     a1, v6, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bge     .temp_label_2
       movs    a1, #1
       add     v6, v6, #1
.if_end_3:
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     a2, [a1]
       b       .if_end_5
.if_wrong_4:
       mov     a1, v3
       mov     a2, v4
       mov     a3, v6
       bl      swap
       mov     v4, a1
       mov     v4, v6
       mul     a1, v4, #2
       add     v6, a1, #1
.if_end_5:
.while_break_1:
       movs    a1, #0
       pop     {r7, pc}
heap_sort:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       div     a1, a1, #2
       sub     a1, a1, #1
.while_continue_6:
       sub     a1, a1, #1
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       bl      heap_ajust
       mov     a1, a1
       sub     a1, a1, #1
.while_break_6:
       sub     a1, a1, #1
.while_continue_7:
       movs    a1, #0
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       bl      swap
       mov     a1, a1
       sub     a1, a1, #1
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       bl      heap_ajust
       mov     a1, a1
       sub     a1, a1, #1
.while_break_7:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #10
       sub    sp, sp, #40
       movs    a2, sp
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #4
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #3
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #9
       str     a2, [a1]
       movs    a1, #3
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #2
       str     a2, [a1]
       movs    a1, #4
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       movs    a1, #5
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #6
       str     a2, [a1]
       movs    a1, #7
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #5
       str     a2, [a1]
       movs    a1, #8
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #7
       str     a2, [a1]
       movs    a1, #9
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #8
       str     a2, [a1]
       movs    a2, #0
       mov     a1, a2
       mov     a2, a1
       bl      heap_sort
       mov     a2, a1
.while_continue_8:
       cmp     a2, a1
       bge     .while_break_8
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       movs    a2, #10
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
       add     a2, a2, #1
.while_break_8:
       movs    a1, #0
       pop     {r7, pc}
n:
       .word    0
