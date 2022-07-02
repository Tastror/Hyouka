MAX:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v2, a1
       mov     v3, a2
       cmp     v2, v3
       bne     .if_wrong_1
       b       .if_end_2
.if_wrong_1:
       b       .if_end_4
.if_wrong_3:
.if_end_4:
.if_end_2:
       mov     a2, a1
       mov     a2, a2
       sub    sp, sp, #64
       movs    a2, sp
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      MAX
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #2
.while_continue_5:
       cmp     a1, a2
       bge     .while_break_5
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       sub     a1, a1, #2
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      MAX
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a1, a1, #1
.while_break_5:
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       pop     {r7, pc}
max_sum_nonadjacent:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       mov     a2, a2
       sub    sp, sp, #64
       movs    a2, sp
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       movs    a1, #2
.while_continue_5:
       cmp     a1, a2
       bge     .while_break_5
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       sub     a1, a1, #2
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a1, a1, #1
.while_break_5:
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       pop     {r7, pc}
longest_common_subseq:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       sub    sp, sp, #1024
       movs    a3, sp
       movs    a1, #1
.while_continue_6:
       movs    a1, #1
.while_continue_7:
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       cmp     a1, a2
       bne     .if_wrong_8
       mov     a2, a1
       mul     a2, a2, #16
       add     a2, a2, a1
       mul     a2, a2, #4
       add     a1, a3, a2
       sub     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #16
       sub     a2, a1, #1
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a3, a1
       ldr     a1, [a2]
       add     a3, a1, #1
       mov     a2, a3
       str     a2, [a1]
       b       .if_end_9
.if_wrong_8:
       mov     a2, a1
       mul     a2, a2, #16
       add     a2, a2, a1
       mul     a2, a2, #4
       add     a1, a3, a2
       sub     a1, a1, #1
       mov     a2, a1
       mul     a2, a2, #16
       add     a2, a2, a1
       mul     a2, a2, #4
       add     a2, a3, a2
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #16
       sub     a2, a1, #1
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a3, a1
       ldr     a2, [a2]
       bl      MAX
       mov     a3, a1
       mov     a2, a3
       str     a2, [a1]
.if_end_9:
       add     a1, a1, #1
.while_break_7:
       add     a1, a1, #1
.while_break_6:
       mov     a1, a2
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a3, a1
       ldr     a1, [a2]
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       sub    sp, sp, #60
       movs    a2, sp
       movs    a1, #8
       str     a1, [a2]
       add     a1, a2, #4
       movs    a2, #7
       str     a2, [a1]
       add     a1, a2, #8
       movs    a2, #4
       str     a2, [a1]
       add     a1, a2, #12
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #16
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #20
       movs    a2, #7
       str     a2, [a1]
       add     a1, a2, #24
       movs    a2, #0
       str     a2, [a1]
       add     a1, a2, #28
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #32
       movs    a2, #9
       str     a2, [a1]
       add     a1, a2, #36
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #40
       movs    a2, #4
       str     a2, [a1]
       add     a1, a2, #44
       movs    a2, #8
       str     a2, [a1]
       add     a1, a2, #48
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #52
       movs    a2, #7
       str     a2, [a1]
       add     a1, a2, #56
       movs    a2, #0
       str     a2, [a1]
       sub    sp, sp, #52
       movs    a2, sp
       movs    a1, #3
       str     a1, [a2]
       add     a1, a2, #4
       movs    a2, #9
       str     a2, [a1]
       add     a1, a2, #8
       movs    a2, #7
       str     a2, [a1]
       add     a1, a2, #12
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #16
       movs    a2, #4
       str     a2, [a1]
       add     a1, a2, #20
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #24
       movs    a2, #4
       str     a2, [a1]
       add     a1, a2, #28
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #32
       movs    a2, #6
       str     a2, [a1]
       add     a1, a2, #36
       movs    a2, #8
       str     a2, [a1]
       add     a1, a2, #40
       movs    a2, #0
       str     a2, [a1]
       add     a1, a2, #44
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #48
       movs    a2, #5
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #15
       bl      max_sum_nonadjacent
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       mov     a1, a2
       movs    a2, #15
       mov     a3, a2
       movs    a4, #13
       bl      longest_common_subseq
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
