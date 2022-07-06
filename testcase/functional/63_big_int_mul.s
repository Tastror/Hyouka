       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #80
       movs    v7, sp
       movs    a1, #1
       str     a1, [v7]
       add     a1, v7, #4
       movs    a2, #2
       str     a2, [a1]
       add     a1, v7, #8
       movs    a2, #3
       str     a2, [a1]
       add     a1, v7, #12
       movs    a2, #4
       str     a2, [a1]
       add     a1, v7, #16
       movs    a2, #5
       str     a2, [a1]
       add     a1, v7, #20
       movs    a2, #6
       str     a2, [a1]
       add     a1, v7, #24
       movs    a2, #7
       str     a2, [a1]
       add     a1, v7, #28
       movs    a2, #8
       str     a2, [a1]
       add     a1, v7, #32
       movs    a2, #9
       str     a2, [a1]
       add     a1, v7, #36
       movs    a2, #0
       str     a2, [a1]
       add     a1, v7, #40
       movs    a2, #1
       str     a2, [a1]
       add     a1, v7, #44
       movs    a2, #2
       str     a2, [a1]
       add     a1, v7, #48
       movs    a2, #3
       str     a2, [a1]
       add     a1, v7, #52
       movs    a2, #4
       str     a2, [a1]
       add     a1, v7, #56
       movs    a2, #5
       str     a2, [a1]
       add     a1, v7, #60
       movs    a2, #6
       str     a2, [a1]
       add     a1, v7, #64
       movs    a2, #7
       str     a2, [a1]
       add     a1, v7, #68
       movs    a2, #8
       str     a2, [a1]
       add     a1, v7, #72
       movs    a2, #9
       str     a2, [a1]
       add     a1, v7, #76
       movs    a2, #0
       str     a2, [a1]
       sub    sp, sp, #80
       movs    spill, sp
       movs    a1, #2
       str     a1, [spill]
       add     a1, spill, #4
       movs    a2, #3
       str     a2, [a1]
       add     a1, spill, #8
       movs    a2, #4
       str     a2, [a1]
       add     a1, spill, #12
       movs    a2, #2
       str     a2, [a1]
       add     a1, spill, #16
       movs    a2, #5
       str     a2, [a1]
       add     a1, spill, #20
       movs    a2, #7
       str     a2, [a1]
       add     a1, spill, #24
       movs    a2, #9
       str     a2, [a1]
       add     a1, spill, #28
       movs    a2, #9
       str     a2, [a1]
       add     a1, spill, #32
       movs    a2, #0
       str     a2, [a1]
       add     a1, spill, #36
       movs    a2, #1
       str     a2, [a1]
       add     a1, spill, #40
       movs    a2, #9
       str     a2, [a1]
       add     a1, spill, #44
       movs    a2, #8
       str     a2, [a1]
       add     a1, spill, #48
       movs    a2, #7
       str     a2, [a1]
       add     a1, spill, #52
       movs    a2, #6
       str     a2, [a1]
       add     a1, spill, #56
       movs    a2, #4
       str     a2, [a1]
       add     a1, spill, #60
       movs    a2, #3
       str     a2, [a1]
       add     a1, spill, #64
       movs    a2, #2
       str     a2, [a1]
       add     a1, spill, #68
       movs    a2, #1
       str     a2, [a1]
       add     a1, spill, #72
       movs    a2, #2
       str     a2, [a1]
       add     a1, spill, #76
       movs    a2, #2
       str     a2, [a1]
       movs    v5, #20
       movs    v6, #20
       sub    sp, sp, #100
       movs    v1, sp
       sub    sp, sp, #100
       movs    v2, sp
       sub    sp, sp, #160
       movs    spill, sp
       movs    v3, #0
.while_continue_1:
       cmp     v3, v5
       bge     .while_break_1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v1, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v7, a1
       ldr     v1, [a1]
       mov     a2, v1
       str     a2, [a1]
       add     v3, v3, #1
.while_break_1:
       movs    v3, #0
.while_continue_2:
       cmp     v3, v6
       bge     .while_break_2
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, spill, a1
       ldr     v2, [a1]
       mov     a2, v2
       str     a2, [a1]
       add     v3, v3, #1
.while_break_2:
       add     a1, v5, v6
       sub     spill, a1, #1
       movs    v3, #0
.while_continue_3:
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, spill, a1
       movs    a2, #0
       str     a2, [a1]
       add     v3, v3, #1
.while_break_3:
       movs    spill, #0
       sub     v3, v6, #1
.while_continue_4:
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     spill, [a1]
       sub     v4, v5, #1
.while_continue_5:
       mov     a1, spill
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, v4
       mul     a1, a1, #4
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a2, spill, a1
       add     spill, a1, a2
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mov     a2, spill
       str     a2, [a1]
       sub     a1, spill, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, spill, a1
       sub     a1, spill, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       div     a2, spill, #10
       add     spill, a1, a2
       mov     a2, spill
       str     a2, [a1]
       b       .if_end_7
.if_wrong_6:
       mov     a1, spill
       mul     a1, a1, #4
       add     a1, spill, a1
       mov     a2, spill
       str     a2, [a1]
.if_end_7:
       sub     v4, v4, #1
       sub     spill, spill, #1
.while_break_5:
       add     a1, spill, v5
       sub     spill, a1, #1
       sub     v3, v3, #1
.while_break_4:
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
.if_end_8:
       movs    v3, #1
.while_continue_9:
       add     a1, v5, v6
       sub     a1, a1, #1
       mov     a1, v3
       mul     a1, a1, #4
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       add     v3, v3, #1
.while_break_9:
       movs    a1, #0
       pop     {r7, pc}
len:
       .word    20
