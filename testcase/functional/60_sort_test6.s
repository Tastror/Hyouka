       .text
       .global      main
counting_sort:
       mov     v6, a1
       mov     spill, a2
       mov     spill, a3
       sub    sp, sp, #40
       movs    v4, sp
       movs    v7, #0
       movs    v5, #0
       movs    v7, #0
.while_continue_1:
       cmp     v7, #10
       bge     .while_break_1
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v4, a1
       movs    a2, #0
       str     a2, [a1]
       add     v7, v7, #1
.while_break_1:
.while_continue_2:
       cmp     v5, spill
       bge     .while_break_2
       mov     a1, v5
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v4, a1
       mov     a1, v5
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       add     v4, a1, #1
       mov     a2, v4
       str     a2, [a1]
       add     v5, v5, #1
.while_break_2:
       movs    v7, #1
.while_continue_3:
       cmp     v7, #10
       bge     .while_break_3
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v4, a1
       mov     a1, v7
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       sub     a1, v7, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v4, a1
       ldr     a2, [a1]
       add     v4, a1, a2
       mov     a2, v4
       str     a2, [a1]
       add     v7, v7, #1
.while_break_3:
       mov     v7, spill
.while_continue_4:
       sub     a1, v7, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v4, a1
       sub     a1, v7, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       sub     v4, a1, #1
       mov     a2, v4
       str     a2, [a1]
       sub     a1, v7, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, spill, a1
       sub     a1, v7, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     spill, [a1]
       mov     a2, spill
       str     a2, [a1]
       sub     v7, v7, #1
.while_break_4:
       movs    a1, #0
       bx      lr
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
       sub    sp, sp, #40
       movs    a2, sp
       mov     a1, a2
       mov     a2, a2
       mov     a3, a1
       bl      counting_sort
       mov     a2, a1
.while_continue_5:
       cmp     a2, a1
       bge     .while_break_5
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
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
n:
       .word    0
