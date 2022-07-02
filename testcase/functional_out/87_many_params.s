sort:
       mov     a2, a1
       mov     a1, a2
       movs    a2, #0
.while_continue_1:
       sub     a1, a1, #1
       cmp     a2, a1
       bge     .while_break_1
       add     a2, a2, #1
.while_continue_2:
       cmp     a2, a1
       bge     .while_break_2
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bge     .if_end_3
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
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
.if_end_3:
       add     a2, a2, #1
.while_break_2:
       add     a2, a2, #1
.while_break_1:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       cmp     a1, #0
       bne     .if_wrong_4
       b       .if_end_5
.if_wrong_4:
.if_end_5:
       mov     a2, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a2, a3, a2
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       mov     a1, a3
       bx      lr
param32_rec:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       cmp     a1, #0
       bne     .if_wrong_4
       b       .if_end_5
.if_wrong_4:
.if_end_5:
       mov     a2, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a2, a3, a2
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       mov     a1, a3
       bx      lr
param32_arr:
       mov     a2, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a2, a3, a2
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a3, a1
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a3, a1, a2
       mov     a1, a3
       bx      lr
param16:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       sub    sp, sp, #64
       movs    a2, sp
       mov     a1, a1
       str     a1, [a2]
       add     a1, a2, #4
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #8
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #12
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #16
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #20
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #24
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #28
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #32
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #36
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #40
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #44
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #48
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #52
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #56
       mov     a2, a1
       str     a2, [a1]
       add     a1, a2, #60
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #16
       bl      sort
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a3, [a2]
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a4, [a2]
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #10
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #11
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #12
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #13
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #14
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #15
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       bl      param32_rec
       mov     a1, a1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #256
       movs    v1, sp
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a2, a1
       bl      t_getint
       mov     a3, a1
       bl      t_getint
       mov     a4, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      param16
       mov     a1, a1
       mov     a1, a1
       str     a1, [v1]
       add     a1, v1, #4
       movs    a2, #8848
       str     a2, [a1]
       movs    v2, #1
.while_continue_6:
       cmp     v2, #32
       bge     .while_break_6
       mov     a1, v2
       mul     a1, a1, #2
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a1, v1, a1
       sub     a1, v2, #1
       mov     a1, a1
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a1, [a2]
       sub     v1, a1, #1
       mov     a2, v1
       str     a2, [a1]
       mov     a1, v2
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a1, v1, a1
       sub     a1, v2, #1
       mov     a1, a1
       mul     a1, a1, #2
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a1, [a2]
       sub     v1, a1, #2
       mov     a2, v1
       str     a2, [a1]
       add     v2, v2, #1
.while_break_6:
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a2, [a2]
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a3, [a2]
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a4, [a2]
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #10
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #11
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #12
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #13
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #14
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #15
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #16
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #17
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #18
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #19
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #20
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #21
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #22
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #23
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #24
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #25
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #26
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #27
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #28
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #29
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #30
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       movs    a1, #31
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     spill, [a2]
       bl      param32_arr
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
