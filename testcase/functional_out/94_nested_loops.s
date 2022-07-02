loop1:
       mov     spill, a1
       mov     spill, a2
       movs    v4, #0
.while_continue_1:
       movs    a1, #0
       cmp     v4, spill
       bge     .temp_label_2
       cmp     v4, spill
       bge     .temp_label_2
       movs    a1, #1
       movs    v5, #0
.while_continue_3:
       cmp     v5, #2
       bge     .while_break_3
       movs    v6, #0
.while_continue_4:
       cmp     v6, #3
       bge     .while_break_4
       movs    v7, #0
.while_continue_5:
       cmp     v7, #4
       bge     .while_break_5
       movs    spill, #0
.while_continue_6:
       cmp     spill, #5
       bge     .while_break_6
       movs    spill, #0
.while_continue_7:
       cmp     spill, #6
       bge     .while_break_7
       movs    spill, #0
.while_continue_8:
       cmp     spill, #2
       bge     .while_break_8
       mov     a1, v4
       mul     a1, a1, #1440
       add     a1, a1, v5
       mul     a1, a1, #720
       add     a1, a1, v6
       mul     a1, a1, #240
       add     a1, a1, v7
       mul     a1, a1, #60
       add     a1, a1, spill
       mul     a1, a1, #12
       add     a1, a1, spill
       mul     a1, a1, #2
       add     a1, a1, spill
       mul     a1, a1, #4
       movw    v3, #:lower16:arr1
       movt    v3, #:upper16:arr1
       ldr     v3, [v3]
       add     a1, v3, a1
       add     a1, v4, v5
       add     a1, a1, v6
       add     a1, a1, v7
       add     a1, a1, spill
       add     a1, a1, spill
       add     a1, a1, spill
       add     a1, a1, spill
       add     v3, a1, spill
       mov     a2, v3
       str     a2, [a1]
       add     spill, spill, #1
.while_break_8:
       add     spill, spill, #1
.while_break_7:
       add     spill, spill, #1
.while_break_6:
       add     v7, v7, #1
.while_break_5:
       add     v6, v6, #1
.while_break_4:
       add     v5, v5, #1
.while_break_3:
       add     v4, v4, #1
.while_break_1:
       movs    a1, #0
.while_continue_9:
       cmp     a1, #10
       bge     .while_break_9
       movs    a2, #0
.while_continue_10:
       cmp     a2, #2
       bge     .while_break_10
       movs    a2, #0
.while_continue_11:
       cmp     a2, #3
       bge     .while_break_11
       movs    a2, #0
.while_continue_12:
       cmp     a2, #2
       bge     .while_break_12
       movs    a2, #0
.while_continue_13:
       cmp     a2, #4
       bge     .while_break_13
       movs    a2, #0
.while_continue_14:
       cmp     a2, #8
       bge     .while_break_14
       movs    a2, #0
.while_continue_15:
       cmp     a2, #7
       bge     .while_break_15
       mov     a1, a1
       mul     a1, a1, #2688
       add     a1, a1, a2
       mul     a1, a1, #1344
       add     a1, a1, a2
       mul     a1, a1, #448
       add     a1, a1, a2
       mul     a1, a1, #224
       add     a1, a1, a2
       mul     a1, a1, #56
       add     a1, a1, a2
       mul     a1, a1, #7
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:arr2
       movt    a2, #:upper16:arr2
       ldr     a2, [a2]
       add     a1, a2, a1
       add     a1, a1, a2
       add     a1, a1, a2
       add     a2, a1, a2
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_15:
       add     a2, a2, #1
.while_break_14:
       add     a2, a2, #1
.while_break_13:
       add     a2, a2, #1
.while_break_12:
       add     a2, a2, #1
.while_break_11:
       add     a2, a2, #1
.while_break_10:
       add     a1, a1, #1
.while_break_9:
       mov     a2, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       movs    a1, #0
       movs    a1, #0
.while_continue_16:
       cmp     a1, #10
       bge     .while_break_16
       movs    a2, #0
.while_continue_17:
       cmp     a2, #100
       bge     .while_break_17
       movs    a2, #0
.while_continue_18:
       cmp     a2, #1000
       bge     .while_break_18
       movs    a2, #0
.while_continue_19:
       cmp     a2, #10000
       bge     .while_break_19
       movs    a2, #0
.while_continue_20:
       cmp     a2, #100000
       bge     .while_break_20
       movs    a2, #0
.while_continue_21:
       cmp     a2, #1000000
       bge     .while_break_21
       movs    a2, #0
.while_continue_22:
       cmp     a2, #10000000
       bge     .while_break_22
       mod     a1, a1, #817
       mov     a1, a1
       mul     a1, a1, #1440
       add     a1, a1, a2
       mul     a1, a1, #720
       add     a1, a1, a2
       mul     a1, a1, #240
       add     a1, a1, a2
       mul     a1, a1, #60
       add     a1, a1, a2
       mul     a1, a1, #12
       add     a1, a1, a2
       mul     a1, a1, #2
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:arr1
       movt    a2, #:upper16:arr1
       ldr     a2, [a2]
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #2688
       add     a1, a1, a2
       mul     a1, a1, #1344
       add     a1, a1, a2
       mul     a1, a1, #448
       add     a1, a1, a2
       mul     a1, a1, #224
       add     a1, a1, a2
       mul     a1, a1, #56
       add     a1, a1, a2
       mul     a1, a1, #7
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:arr2
       movt    a2, #:upper16:arr2
       ldr     a2, [a2]
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       add     a2, a2, #1
       b       .while_continue_22
.if_end_23:
.while_break_22:
       add     a2, a2, #1
       b       .while_continue_21
.if_end_24:
.while_break_21:
       add     a2, a2, #1
       b       .while_continue_20
.if_end_25:
.while_break_20:
       add     a2, a2, #1
       b       .while_continue_19
.if_end_26:
.while_break_19:
       add     a2, a2, #1
       b       .while_continue_18
.if_end_27:
.while_break_18:
       add     a2, a2, #1
       b       .while_continue_17
.if_end_28:
.while_break_17:
       add     a1, a1, #1
       b       .while_continue_16
.if_end_29:
.while_break_16:
       mov     a1, a1
       bx      lr
loop2:
       movs    a1, #0
.while_continue_9:
       cmp     a1, #10
       bge     .while_break_9
       movs    a2, #0
.while_continue_10:
       cmp     a2, #2
       bge     .while_break_10
       movs    a2, #0
.while_continue_11:
       cmp     a2, #3
       bge     .while_break_11
       movs    a2, #0
.while_continue_12:
       cmp     a2, #2
       bge     .while_break_12
       movs    a2, #0
.while_continue_13:
       cmp     a2, #4
       bge     .while_break_13
       movs    a2, #0
.while_continue_14:
       cmp     a2, #8
       bge     .while_break_14
       movs    a2, #0
.while_continue_15:
       cmp     a2, #7
       bge     .while_break_15
       mov     a1, a1
       mul     a1, a1, #2688
       add     a1, a1, a2
       mul     a1, a1, #1344
       add     a1, a1, a2
       mul     a1, a1, #448
       add     a1, a1, a2
       mul     a1, a1, #224
       add     a1, a1, a2
       mul     a1, a1, #56
       add     a1, a1, a2
       mul     a1, a1, #7
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       add     a1, a1, a2
       add     a1, a1, a2
       add     a2, a1, a2
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_15:
       add     a2, a2, #1
.while_break_14:
       add     a2, a2, #1
.while_break_13:
       add     a2, a2, #1
.while_break_12:
       add     a2, a2, #1
.while_break_11:
       add     a2, a2, #1
.while_break_10:
       add     a1, a1, #1
.while_break_9:
       mov     a2, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       movs    a1, #0
       movs    a1, #0
.while_continue_16:
       cmp     a1, #10
       bge     .while_break_16
       movs    a2, #0
.while_continue_17:
       cmp     a2, #100
       bge     .while_break_17
       movs    a2, #0
.while_continue_18:
       cmp     a2, #1000
       bge     .while_break_18
       movs    a2, #0
.while_continue_19:
       cmp     a2, #10000
       bge     .while_break_19
       movs    a2, #0
.while_continue_20:
       cmp     a2, #100000
       bge     .while_break_20
       movs    a2, #0
.while_continue_21:
       cmp     a2, #1000000
       bge     .while_break_21
       movs    a2, #0
.while_continue_22:
       cmp     a2, #10000000
       bge     .while_break_22
       mod     a1, a1, #817
       mov     a1, a1
       mul     a1, a1, #1440
       add     a1, a1, a2
       mul     a1, a1, #720
       add     a1, a1, a2
       mul     a1, a1, #240
       add     a1, a1, a2
       mul     a1, a1, #60
       add     a1, a1, a2
       mul     a1, a1, #12
       add     a1, a1, a2
       mul     a1, a1, #2
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #2688
       add     a1, a1, a2
       mul     a1, a1, #1344
       add     a1, a1, a2
       mul     a1, a1, #448
       add     a1, a1, a2
       mul     a1, a1, #224
       add     a1, a1, a2
       mul     a1, a1, #56
       add     a1, a1, a2
       mul     a1, a1, #7
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       add     a2, a2, #1
       b       .while_continue_22
.if_end_23:
.while_break_22:
       add     a2, a2, #1
       b       .while_continue_21
.if_end_24:
.while_break_21:
       add     a2, a2, #1
       b       .while_continue_20
.if_end_25:
.while_break_20:
       add     a2, a2, #1
       b       .while_continue_19
.if_end_26:
.while_break_19:
       add     a2, a2, #1
       b       .while_continue_18
.if_end_27:
.while_break_18:
       add     a2, a2, #1
       b       .while_continue_17
.if_end_28:
.while_break_17:
       add     a1, a1, #1
       b       .while_continue_16
.if_end_29:
.while_break_16:
       mov     a1, a1
       bx      lr
loop3:
       mov     a2, a1
       mov     a1, a2
       mov     a1, a3
       mov     a1, a4
       mov     a1, spill
       mov     a1, spill
       mov     a1, spill
       movs    a1, #0
       movs    a1, #0
.while_continue_16:
       cmp     a1, #10
       bge     .while_break_16
       movs    a2, #0
.while_continue_17:
       cmp     a2, #100
       bge     .while_break_17
       movs    a2, #0
.while_continue_18:
       cmp     a2, #1000
       bge     .while_break_18
       movs    a2, #0
.while_continue_19:
       cmp     a2, #10000
       bge     .while_break_19
       movs    a2, #0
.while_continue_20:
       cmp     a2, #100000
       bge     .while_break_20
       movs    a2, #0
.while_continue_21:
       cmp     a2, #1000000
       bge     .while_break_21
       movs    a2, #0
.while_continue_22:
       cmp     a2, #10000000
       bge     .while_break_22
       mod     a1, a1, #817
       mov     a1, a1
       mul     a1, a1, #1440
       add     a1, a1, a2
       mul     a1, a1, #720
       add     a1, a1, a2
       mul     a1, a1, #240
       add     a1, a1, a2
       mul     a1, a1, #60
       add     a1, a1, a2
       mul     a1, a1, #12
       add     a1, a1, a2
       mul     a1, a1, #2
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #2688
       add     a1, a1, a2
       mul     a1, a1, #1344
       add     a1, a1, a2
       mul     a1, a1, #448
       add     a1, a1, a2
       mul     a1, a1, #224
       add     a1, a1, a2
       mul     a1, a1, #56
       add     a1, a1, a2
       mul     a1, a1, #7
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       add     a2, a2, #1
       b       .while_continue_22
.if_end_23:
.while_break_22:
       add     a2, a2, #1
       b       .while_continue_21
.if_end_24:
.while_break_21:
       add     a2, a2, #1
       b       .while_continue_20
.if_end_25:
.while_break_20:
       add     a2, a2, #1
       b       .while_continue_19
.if_end_26:
.while_break_19:
       add     a2, a2, #1
       b       .while_continue_18
.if_end_27:
.while_break_18:
       add     a2, a2, #1
       b       .while_continue_17
.if_end_28:
.while_break_17:
       add     a1, a1, #1
       b       .while_continue_16
.if_end_29:
.while_break_16:
       mov     a1, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       bl      loop1
       mov     a1, a1
       bl      loop2
       mov     a1, a1
       mov     a1, a1
       mov     a2, a1
       mov     a3, a1
       mov     a4, a1
       mov     spill, a1
       mov     spill, a1
       mov     spill, a1
       bl      loop3
       mov     a1, a1
       pop     {r7, pc}
arr1:
       .word    0.000000
       .word    0.000000
arr2:
       .word    0.000000
       .word    0.000000
