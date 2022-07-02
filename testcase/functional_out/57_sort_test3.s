QuickSort:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v3, a1
       mov     v5, a2
       mov     v4, a3
       cmp     v5, v4
       bge     .if_end_1
       mov     v6, v5
       mov     v7, v4
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     spill, [a1]
.while_continue_2:
       cmp     v6, v7
       bge     .while_break_2
.while_continue_3:
       movs    a1, #0
       cmp     v6, v7
       bge     .temp_label_4
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     a2, [a1]
       sub     a1, spill, #1
       movs    a1, #1
       sub     v7, v7, #1
.while_break_3:
       cmp     v6, v7
       bge     .if_end_5
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     v3, [a1]
       mov     a2, v3
       str     a2, [a1]
       add     v6, v6, #1
.if_end_5:
.while_continue_6:
       movs    a1, #0
       cmp     v6, v7
       bge     .temp_label_7
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       cmp     a1, spill
       bge     .temp_label_7
       movs    a1, #1
       add     v6, v6, #1
.while_break_6:
       cmp     v6, v7
       bge     .if_end_8
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     v3, [a1]
       mov     a2, v3
       str     a2, [a1]
       sub     v7, v7, #1
.if_end_8:
.while_break_2:
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a2, spill
       str     a2, [a1]
       sub     a1, v6, #1
       mov     a1, v3
       mov     a2, v5
       mov     a3, a1
       bl      QuickSort
       mov     a1, a1
       add     a1, v6, #1
       mov     a1, v3
       mov     a2, a1
       mov     a3, v4
       bl      QuickSort
       mov     a1, a1
.if_end_1:
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
       movs    a1, #9
       mov     a1, a2
       mov     a2, a2
       mov     a3, a1
       bl      QuickSort
       mov     a2, a1
.while_continue_9:
       cmp     a2, a1
       bge     .while_break_9
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
.while_break_9:
       movs    a1, #0
       pop     {r7, pc}
n:
       .word    0
