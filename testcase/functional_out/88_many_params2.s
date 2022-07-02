func:
       push    {r7, lr}
       add     r7, sp, #0
       mov     spill, a1
       mov     spill, a2
       mov     spill, a3
       mov     spill, a4
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_1:
       cmp     spill, #10
       bge     .while_break_1
       mov     a1, spill
       mul     a1, a1, #59
       add     a1, a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a1, [a1]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       add     spill, spill, #1
.while_break_1:
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     a1, [a1]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.while_continue_2:
       cmp     spill, #10
       bge     .while_break_2
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mul     a1, spill, #128875
       mod     spill, a1, #3724
       mov     a2, spill
       str     a2, [a1]
       add     spill, spill, #1
       add     spill, spill, #7
.while_break_2:
       add     a1, spill, spill
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #16348
       movs    a2, sp
       sub    sp, sp, #12508
       movs    a2, sp
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #6
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #7
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #4
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #7
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #9
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #11
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #11
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #2
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #3
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #9
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #9
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a2, a2
       movs    a1, #17
       mul     a1, a1, #67
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a3, [a2]
       movs    a1, #17
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a4, [a2]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #34
       mul     a1, a1, #59
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       movs    a1, #51
       mul     a1, a1, #59
       add     a1, a1, #18
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     spill, [a2]
       bl      func
       mov     a1, a1
       mul     a2, a1, #3
.while_continue_3:
       movs    a1, #6
       mul     a1, a1, #59
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       sub     a2, a2, #1
.while_break_3:
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
