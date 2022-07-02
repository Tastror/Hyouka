bubblesort:
       mov     a2, a1
       movs    a2, #0
.while_continue_1:
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       sub     a1, a1, #1
       cmp     a2, a1
       bge     .while_break_1
       movs    a2, #0
.while_continue_2:
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       sub     a1, a1, a2
       sub     a1, a1, #1
       cmp     a2, a1
       bge     .while_break_2
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a2, #1
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
.if_end_3:
       add     a2, a2, #1
.while_break_2:
       add     a2, a2, #1
.while_break_1:
       movs    a1, #0
       bx      lr
insertsort:
       mov     a2, a1
       movs    a2, #1
.while_continue_4:
       cmp     a2, a1
       bge     .while_break_4
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       sub     a1, a2, #1
.while_continue_5:
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a2, a1
       bge     .temp_label_6
       movs    a1, #1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       sub     a1, a1, #1
.while_break_5:
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_4:
       movs    a1, #0
       bx      lr
QuickSort:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v3, a1
       mov     v5, a2
       mov     v4, a3
       cmp     v5, v4
       bge     .if_end_7
       mov     v6, v5
       mov     v7, v4
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     spill, [a1]
.while_continue_8:
       cmp     v6, v7
       bge     .while_break_8
.while_continue_9:
       movs    a1, #0
       cmp     v6, v7
       bge     .temp_label_10
       mov     a1, v7
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       sub     a2, spill, #1
       movs    a1, #1
       sub     v7, v7, #1
.while_break_9:
       cmp     v6, v7
       bge     .if_end_11
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
.if_end_11:
.while_continue_12:
       movs    a1, #0
       cmp     v6, v7
       bge     .temp_label_13
       mov     a1, v6
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       cmp     a1, spill
       bge     .temp_label_13
       movs    a1, #1
       add     v6, v6, #1
.while_break_12:
       cmp     v6, v7
       bge     .if_end_14
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
.if_end_14:
.while_break_8:
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
.if_end_7:
       movs    a1, #0
       pop     {r7, pc}
getMid:
       mov     a1, a1
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       mod     a1, a1, #2
       cmp     a1, #0
       bne     .if_wrong_15
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       div     a1, a1, #2
       b       .if_end_16
.if_wrong_15:
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       div     a1, a1, #2
.if_end_16:
       mov     a2, a1
       sub    sp, sp, #4000
       movs    a2, sp
       movs    a2, #0
.while_continue_17:
       cmp     a2, #1000
       bge     .while_break_17
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       add     a2, a2, #1
.while_break_17:
       movs    a2, #0
       movs    a2, #0
.while_continue_18:
       cmp     a2, a1
       bge     .while_break_18
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
.if_end_19:
       add     a2, a2, #1
.while_break_18:
       mov     a1, a1
       bx      lr
getMost:
       mov     a2, a1
       sub    sp, sp, #4000
       movs    a2, sp
       movs    a2, #0
.while_continue_17:
       cmp     a2, #1000
       bge     .while_break_17
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       add     a2, a2, #1
.while_break_17:
       movs    a2, #0
       movs    a2, #0
.while_continue_18:
       cmp     a2, a1
       bge     .while_break_18
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
.if_end_19:
       add     a2, a2, #1
.while_break_18:
       mov     a1, a1
       bx      lr
revert:
       mov     a2, a1
       movs    a1, #0
       movs    a2, #0
.while_continue_20:
       cmp     a1, a2
       bge     .while_break_20
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
       add     a1, a1, #1
       sub     a2, a2, #1
.while_break_20:
       movs    a1, #0
       bx      lr
arrCopy:
       mov     a2, a1
       mov     a2, a2
       movs    a2, #0
.while_continue_21:
       cmp     a2, a1
       bge     .while_break_21
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_21:
       movs    a1, #0
       bx      lr
calSum:
       mov     a2, a1
       mov     a1, a2
       movs    a2, #0
       movs    a2, #0
.while_continue_22:
       cmp     a2, a1
       bge     .while_break_22
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, a1
       mod     a1, a2, a1
       sub     a2, a1, #1
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       b       .if_end_24
.if_wrong_23:
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       movs    a2, #0
.if_end_24:
       add     a2, a2, #1
.while_break_22:
       movs    a1, #0
       bx      lr
avgPooling:
       mov     a2, a1
       mov     a1, a2
       movs    a2, #0
       movs    a2, #0
.while_continue_25:
       cmp     a2, a1
       bge     .while_break_25
       sub     a1, a1, #1
       cmp     a2, a1
       bge     .if_wrong_26
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a2, a1
       b       .if_end_27
.if_wrong_26:
       sub     a1, a1, #1
       cmp     a2, a1
       bne     .if_wrong_28
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       div     a2, a2, a1
       mov     a2, a2
       str     a2, [a1]
       b       .if_end_29
.if_wrong_28:
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a1, a2, a1
       sub     a2, a1, a2
       sub     a1, a2, a1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       sub     a1, a2, a1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       div     a2, a2, a1
       mov     a2, a2
       str     a2, [a1]
.if_end_29:
.if_end_27:
       add     a2, a2, #1
.while_break_25:
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       sub     a1, a1, a1
       add     a2, a1, #1
.while_continue_30:
       cmp     a2, a1
       bge     .while_break_30
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       add     a2, a2, #1
.while_break_30:
       movs    a1, #0
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #32
       sub    sp, sp, #128
       movs    a2, sp
       sub    sp, sp, #128
       movs    a2, sp
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #7
       str     a2, [a1]
       movs    a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #23
       str     a2, [a1]
       movs    a1, #2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #89
       str     a2, [a1]
       movs    a1, #3
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #26
       str     a2, [a1]
       movs    a1, #4
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #282
       str     a2, [a1]
       movs    a1, #5
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #254
       str     a2, [a1]
       movs    a1, #6
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #27
       str     a2, [a1]
       movs    a1, #7
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #5
       str     a2, [a1]
       movs    a1, #8
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #83
       str     a2, [a1]
       movs    a1, #9
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #273
       str     a2, [a1]
       movs    a1, #10
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #574
       str     a2, [a1]
       movs    a1, #11
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #905
       str     a2, [a1]
       movs    a1, #12
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #354
       str     a2, [a1]
       movs    a1, #13
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #657
       str     a2, [a1]
       movs    a1, #14
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #935
       str     a2, [a1]
       movs    a1, #15
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #264
       str     a2, [a1]
       movs    a1, #16
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #639
       str     a2, [a1]
       movs    a1, #17
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #459
       str     a2, [a1]
       movs    a1, #18
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #29
       str     a2, [a1]
       movs    a1, #19
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #68
       str     a2, [a1]
       movs    a1, #20
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #929
       str     a2, [a1]
       movs    a1, #21
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #756
       str     a2, [a1]
       movs    a1, #22
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #452
       str     a2, [a1]
       movs    a1, #23
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #279
       str     a2, [a1]
       movs    a1, #24
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #58
       str     a2, [a1]
       movs    a1, #25
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #87
       str     a2, [a1]
       movs    a1, #26
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #96
       str     a2, [a1]
       movs    a1, #27
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #36
       str     a2, [a1]
       movs    a1, #28
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #39
       str     a2, [a1]
       movs    a1, #29
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #28
       str     a2, [a1]
       movs    a1, #30
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #1
       str     a2, [a1]
       movs    a1, #31
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #290
       str     a2, [a1]
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       mov     a1, a2
       bl      revert
       mov     a2, a1
       movs    a1, #0
.while_continue_31:
       cmp     a1, #32
       bge     .while_break_31
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_31:
       mov     a1, a2
       bl      bubblesort
       mov     a2, a1
       movs    a1, #0
.while_continue_32:
       cmp     a1, #32
       bge     .while_break_32
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_32:
       mov     a1, a2
       bl      getMid
       mov     a2, a1
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       mov     a1, a2
       bl      getMost
       mov     a2, a1
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       mov     a1, a2
       bl      bubblesort
       mov     a2, a1
       movs    a1, #0
.while_continue_33:
       cmp     a1, #32
       bge     .while_break_33
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_33:
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       mov     a1, a2
       bl      insertsort
       mov     a2, a1
       movs    a1, #0
.while_continue_34:
       cmp     a1, #32
       bge     .while_break_34
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_34:
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       movs    a1, #0
       movs    a2, #31
       mov     a1, a2
       mov     a2, a1
       mov     a3, a2
       bl      QuickSort
       mov     a2, a1
.while_continue_35:
       cmp     a1, #32
       bge     .while_break_35
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_35:
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       mov     a1, a2
       movs    a2, #4
       bl      calSum
       mov     a2, a1
       movs    a1, #0
.while_continue_36:
       cmp     a1, #32
       bge     .while_break_36
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_36:
       mov     a1, a2
       mov     a2, a2
       bl      arrCopy
       mov     a2, a1
       mov     a1, a2
       movs    a2, #3
       bl      avgPooling
       mov     a2, a1
       movs    a1, #0
.while_continue_37:
       cmp     a1, #32
       bge     .while_break_37
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a1, a2
       bl      t_putint
       mov     a1, a1
       add     a1, a1, #1
.while_break_37:
       movs    a1, #0
       pop     {r7, pc}
n:
       .word    0
