       .text
       .global      main
select_sort:
       mov     a2, a1
       mov     a2, a2
       movs    a2, #0
.while_continue_1:
       sub     a1, a2, #1
       cmp     a2, a1
       bge     .while_break_1
       mov     a1, a2
       add     a1, a2, #1
.while_continue_2:
       cmp     a1, a2
       bge     .while_break_2
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a1
.if_end_3:
       add     a1, a1, #1
.while_break_2:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
.if_end_4:
       add     a2, a2, #1
.while_break_1:
       movs    a1, #0
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v1, #10
       sub    sp, sp, #40
       movs    v2, sp
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #4
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #3
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #9
       str     a2, [a1]
       movs    a1, #3
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #2
       str     a2, [a1]
       movs    a1, #4
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #0
       str     a2, [a1]
       movs    a1, #5
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #6
       str     a2, [a1]
       movs    a1, #7
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #5
       str     a2, [a1]
       movs    a1, #8
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #7
       str     a2, [a1]
       movs    a1, #9
       mul     a1, a1, #4
       add     a1, v2, a1
       movs    a2, #8
       str     a2, [a1]
       movs    v3, #0
       mov     a1, v2
       mov     a2, v1
       bl      select_sort
       mov     v3, a1
.while_continue_5:
       cmp     v3, v1
       bge     .while_break_5
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       movs    a2, #10
       mov     a1, a2
       bl      t_putch
       mov     a1, a1
       add     v3, v3, #1
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
n:
       .word    0
