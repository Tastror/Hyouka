       .text
       .global      main
my_memset:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       mov     a1, a2
       mov     a2, a3
       movs    a1, #0
.while_continue_1:
       cmp     a1, a2
       bge     .while_break_1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       add     a1, a1, #1
.while_break_1:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v7, #:lower16:to
       movt    v7, #:upper16:to
       ldr     v7, [v7]
       add     a2, v7, a1
       mov     a1, a1
       str     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v4, #:lower16:cap
       movt    v4, #:upper16:cap
       ldr     v4, [v4]
       add     a1, v4, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v5, #:lower16:rev
       movt    v5, #:upper16:rev
       ldr     v5, [v5]
       add     a1, v5, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     v5, [a1]
       mov     a2, v5
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v7, #:lower16:to
       movt    v7, #:upper16:to
       ldr     v7, [v7]
       add     a1, v7, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v4, #:lower16:cap
       movt    v4, #:upper16:cap
       ldr     v4, [v4]
       add     a1, v4, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    v5, #:lower16:rev
       movt    v5, #:upper16:rev
       ldr     v5, [v5]
       add     a1, v5, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       ldr     v5, [a1]
       mov     a2, v5
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a2, v6, a1
       ldr     a1, [a2]
       add     v6, a1, #1
       mov     a2, v6
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a1, v6, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v6, #:lower16:size
       movt    v6, #:upper16:size
       ldr     v6, [v6]
       add     a2, v6, a1
       ldr     a1, [a2]
       add     v6, a1, #1
       mov     a2, v6
       str     a2, [a1]
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       cmp     a1, a2
       bne     .if_end_2
.if_end_2:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:used
       movt    a2, #:upper16:used
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a2, #0
.while_continue_3:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:size
       movt    a2, #:upper16:size
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .while_break_3
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:to
       movt    a2, #:upper16:to
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:used
       movt    a2, #:upper16:used
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_4:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_5:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .if_wrong_6
       mov     a2, a2
       b       .if_end_7
.if_wrong_6:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a1, a2, a1
       ldr     a2, [a1]
.if_end_7:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:to
       movt    a2, #:upper16:to
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a2, a2
       mov     a3, a2
       bl      dfs
       mov     a3, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a2, a1, a3
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:to
       movt    a2, #:upper16:to
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:rev
       movt    a2, #:upper16:rev
       ldr     a2, [a2]
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a2, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:to
       movt    a2, #:upper16:to
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a3, a1
       mul     a3, a3, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:rev
       movt    a2, #:upper16:rev
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a3, a1
       mul     a3, a3, #4
       movw    a2, #:lower16:cap
       movt    a2, #:upper16:cap
       ldr     a2, [a2]
       add     a1, a2, a3
       ldr     a2, [a1]
       add     a2, a2, a3
       mov     a1, a2
       str     a1, [a2]
.if_end_8:
       add     a2, a2, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
add_node:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, v7, a1
       mov     a1, a1
       str     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, v4, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, v5, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v5, [a1]
       mov     a2, v5
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, v7, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, v4, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, v5, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v5, [a1]
       mov     a2, v5
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       add     v6, a1, #1
       mov     a2, v6
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, v6, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, v6, a1
       ldr     a1, [a2]
       add     v6, a1, #1
       mov     a2, v6
       str     a2, [a1]
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       cmp     a1, a2
       bne     .if_end_2
.if_end_2:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a2, #0
.while_continue_3:
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .while_break_3
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_4:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_5:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .if_wrong_6
       mov     a2, a2
       b       .if_end_7
.if_wrong_6:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
.if_end_7:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a2, a2
       mov     a3, a2
       bl      
       mov     a3, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a2, a1, a3
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a3, a1
       mul     a3, a3, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a3, a1
       mul     a3, a3, #4
       add     a1, a2, a3
       ldr     a2, [a1]
       add     a2, a2, a3
       mov     a1, a2
       str     a1, [a2]
.if_end_8:
       add     a2, a2, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
dfs:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       cmp     a1, a2
       bne     .if_end_2
.if_end_2:
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a2, #0
.while_continue_3:
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .while_break_3
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_4:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, #1
       b       .while_break_3
.if_end_5:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .if_wrong_6
       mov     a2, a2
       b       .if_end_7
.if_wrong_6:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
.if_end_7:
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a2, a2
       mov     a3, a2
       bl      
       mov     a3, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a2, a1, a3
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a3, a1
       mul     a3, a3, #10
       mov     a1, a1
       mul     a1, a1, #10
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a3, a3, a1
       mul     a3, a3, #4
       add     a1, a2, a3
       ldr     a2, [a1]
       add     a2, a2, a3
       mov     a1, a2
       str     a1, [a2]
.if_end_8:
       add     a2, a2, #1
.while_break_3:
       movs    a1, #0
       pop     {r7, pc}
max_flow:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       movs    a2, #0
.while_continue_9:
       mov     a1, a1
       movs    a2, #0
       movs    a3, #10
       bl      my_memset
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       movs    a3, #1879048192
       bl      dfs
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_10
.if_end_10:
       add     a2, a2, a1
.while_break_9:
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       mov     a1, a1
       movs    a2, #0
       movs    a3, #10
       bl      my_memset
       mov     a1, a1
.while_continue_11:
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       bl      add_node
       mov     a1, a1
       sub     a1, a1, #1
.while_break_11:
       movs    a1, #1
       mov     a2, a1
       bl      max_flow
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       mov     a1, a1
       movs    a2, #0
       movs    a3, #10
       bl      memset
       mov     a1, a1
.while_continue_11:
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       bl      _node
       mov     a1, a1
       sub     a1, a1, #1
.while_break_11:
       movs    a1, #1
       mov     a2, a1
       bl      _flow
       mov     a1, a1
       mov     a1, a1
       bl      utint
       mov     a1, a1
       movs    a1, #10
       bl      utch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
INF:
       .word    1879048192
size:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
to:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
cap:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
rev:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
used:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
