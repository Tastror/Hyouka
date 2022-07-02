long_array:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v7, a1
       sub    sp, sp, #40000
       movs    v2, sp
       sub    sp, sp, #40000
       movs    v3, sp
       sub    sp, sp, #40000
       movs    v4, sp
       movs    v6, #0
.while_continue_1:
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v2, a1
       mul     a1, v6, v6
       mod     v2, a1, #10
       mov     a2, v2
       str     a2, [a1]
       add     v6, v6, #1
.while_break_1:
       movs    v6, #0
.while_continue_2:
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       mul     a1, a1, a2
       mod     v3, a1, #10
       mov     a1, v3
       str     a1, [a2]
       add     v6, v6, #1
.while_break_2:
       movs    v6, #0
.while_continue_3:
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v4, a1
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     a2, [a1]
       mul     a1, a1, a2
       mod     a1, a1, #100
       mov     a1, v6
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       add     v4, a1, a2
       mov     a2, v4
       str     a2, [a1]
       add     v6, v6, #1
.while_break_3:
       movs    v5, #0
       movs    v6, #0
.while_continue_4:
       cmp     v6, #10
       bge     .if_wrong_5
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       add     a1, v5, a1
       mod     v5, a1, #1333
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       b       .if_end_6
.if_wrong_5:
       cmp     v6, #20
       bge     .if_wrong_7
       movs    v7, #5000
.while_continue_9:
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       add     a1, v5, a1
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       sub     v5, a1, a2
       add     v7, v7, #1
.while_break_9:
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       b       .if_end_8
.if_wrong_7:
       cmp     v6, #30
       bge     .if_wrong_10
       movs    v7, #5000
.while_continue_12:
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       add     a1, v5, a1
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       sub     v5, a1, a2
       add     v7, v7, #1
       b       .if_end_14
.if_wrong_13:
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v2, a1
       ldr     a1, [a2]
       add     a1, v5, a1
       mov     a1, v7
       mul     a1, a1, #4
       add     a1, v4, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mod     v5, a1, #13333
       add     v7, v7, #2
.if_end_14:
.while_break_12:
       mov     a1, v5
       bl      t_putint
       mov     a1, a1
       b       .if_end_11
.if_wrong_10:
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mul     a1, a1, v7
       add     a1, v5, a1
       mod     v5, a1, #99988
.if_end_11:
.if_end_8:
.if_end_6:
       add     v6, v6, #1
.while_break_4:
       mov     a1, v5
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #9
       bl      long_array
       mov     a1, a1
       pop     {r7, pc}
N:
       .word    10000
