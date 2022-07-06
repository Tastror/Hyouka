       .text
       .global      main
isdigit:
       mov     a1, a1
       movs    a1, #0
       movs    a1, #1
.if_end_2:
       movs    a1, #0
       bx      lr
power:
       mov     a1, a1
       mov     a1, a2
       movs    a2, #1
.while_continue_3:
       mul     a2, a2, a1
       sub     a1, a1, #1
.while_break_3:
       mov     a1, a2
       bx      lr
getstr:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       bl      t_getch
       mov     a1, a1
       movs    a1, #0
.while_continue_4:
       movs    a1, #0
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       mov     a1, a1
       str     a1, [a2]
       add     a1, a1, #1
       bl      t_getch
       mov     a1, a1
.while_break_4:
       mov     a1, a1
       pop     {r7, pc}
intpush:
       mov     a1, a1
       movw    a1, #:lower16:intt
       movt    a1, #:upper16:intt
       ldr     a1, [a1]
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a1
       movw    a1, #:lower16:chat
       movt    a1, #:upper16:chat
       ldr     a1, [a1]
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       movw    a1, #:lower16:intt
       movt    a1, #:upper16:intt
       ldr     a1, [a1]
       sub     a1, a1, #1
       movw    a1, #:lower16:intt
       movt    a1, #:upper16:intt
       ldr     a1, [a1]
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
chapush:
       mov     a1, a1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       sub     a1, a1, #1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
intpop:
       sub     a1, a1, #1
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bx      lr
chapop:
       movw    v2, #:lower16:chat
       movt    v2, #:upper16:chat
       ldr     v2, [v2]
       sub     v2, v2, #1
       movw    v2, #:lower16:chat
       movt    v2, #:upper16:chat
       ldr     v2, [v2]
       add     a1, v2, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:chas
       movt    v1, #:upper16:chas
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       bx      lr
intadd:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #10
       mov     a2, a2
       str     a2, [a1]
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a1, a2
       mov     a2, a2
       str     a2, [a1]
       bl      chapop
       mov     a1, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #32
       str     a2, [a1]
       movw    a1, #:lower16:ii
       movt    a1, #:upper16:ii
       ldr     a1, [a1]
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       movw    a1, #:lower16:ii
       movt    a1, #:upper16:ii
       ldr     a1, [a1]
       add     a1, a1, #2
       cmp     a1, #0
       bne     .if_end_6
.if_end_6:
       movs    a1, #1
       pop     {r7, pc}
find:
       push    {r7, lr}
       add     r7, sp, #0
       bl      pop
       mov     a1, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #32
       str     a2, [a1]
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       add     a1, a1, #2
       cmp     a1, #0
       bne     .if_end_6
.if_end_6:
       movs    a1, #1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #0
       movs    a1, #0
       mov     a1, a2
       bl      getstr
       mov     a2, a1
.while_continue_7:
       cmp     a1, a2
       bge     .while_break_7
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      isdigit
       mov     a1, a1
       cmp     a1, #1
       bne     .if_wrong_8
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a1, a2, a1
       ldr     a2, [a1]
       mov     a2, a2
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a2, a2, #1
       b       .if_end_9
.if_wrong_8:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #40
       bne     .if_end_10
       movs    a1, #40
       bl      chapush
       mov     a1, a1
.if_end_10:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .if_end_11
       movs    a1, #94
       bl      chapush
       mov     a1, a1
.if_end_11:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #41
       bne     .if_end_12
       bl      chapop
       mov     a1, a1
.while_continue_13:
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #32
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a2, a2, #2
       bl      chapop
       mov     a1, a1
.while_break_13:
.if_end_12:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #43
       bne     .if_end_14
.while_continue_15:
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #43
       bne     .temp_label_20
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #45
       bne     .temp_label_20
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_19
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_18
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_17
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_16
       movs    a1, #0
       bl      find
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_21
       b       .while_continue_15
.if_end_21:
.while_break_15:
       movs    a1, #43
       bl      chapush
       mov     a1, a1
.if_end_14:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #45
       bne     .if_end_22
.while_continue_23:
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #43
       bne     .temp_label_28
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #45
       bne     .temp_label_28
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_27
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_26
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_25
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_24
       movs    a1, #0
       bl      find
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_29
       b       .while_continue_23
.if_end_29:
.while_break_23:
       movs    a1, #45
       bl      chapush
       mov     a1, a1
.if_end_22:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .if_end_30
.while_continue_31:
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_34
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_34
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_33
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_32
       movs    a1, #0
       bl      find
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_35
       b       .while_continue_31
.if_end_35:
.while_break_31:
       movs    a1, #42
       bl      chapush
       mov     a1, a1
.if_end_30:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .if_end_36
.while_continue_37:
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_40
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_40
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_39
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_38
       movs    a1, #0
       bl      find
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_41
       b       .while_continue_37
.if_end_41:
.while_break_37:
       movs    a1, #47
       bl      chapush
       mov     a1, a1
.if_end_36:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get
       movt    a2, #:upper16:get
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .if_end_42
.while_continue_43:
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_46
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_46
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_45
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:chas
       movt    a2, #:upper16:chas
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_44
       movs    a1, #0
       bl      find
       mov     a1, a1
       cmp     a1, #0
       bne     .if_end_47
       b       .while_continue_43
.if_end_47:
.while_break_43:
       movs    a1, #37
       bl      chapush
       mov     a1, a1
.if_end_42:
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #32
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a2, a2, #1
.if_end_9:
       movw    a1, #:lower16:i
       movt    a1, #:upper16:i
       ldr     a1, [a1]
       add     a1, a1, #1
.while_break_7:
.while_continue_48:
       bl      chapop
       mov     a1, a1
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #32
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a2, a2, #2
.while_break_48:
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #64
       str     a2, [a1]
       movs    a1, #1
.while_continue_49:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       movs    a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #43
       bne     .temp_label_54
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #45
       bne     .temp_label_54
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .temp_label_53
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .temp_label_52
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .temp_label_51
       movs    a1, #0
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .temp_label_50
       movs    a1, #0
       bl      intpop
       mov     a1, a1
       bl      intpop
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #43
       bne     .if_end_57
       add     a1, a1, a2
.if_end_57:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #45
       bne     .if_end_58
       sub     a1, a2, a1
.if_end_58:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #42
       bne     .if_end_59
       mul     a1, a1, a2
.if_end_59:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #47
       bne     .if_end_60
       div     a1, a2, a1
.if_end_60:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #37
       bne     .if_end_61
       mod     a1, a2, a1
.if_end_61:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       cmp     a1, #94
       bne     .if_end_62
       mov     a1, a2
       mov     a2, a1
       bl      power
       mov     a1, a1
.if_end_62:
       mov     a1, a1
       bl      intpush
       mov     a1, a1
       b       .if_end_56
.if_wrong_55:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a1, a1, #48
       bl      intpush
       mov     a1, a1
       movs    a2, #1
.while_continue_64:
       movw    a1, #:lower16:i
       movt    a1, #:upper16:i
       ldr     a1, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movw    a1, #:lower16:i
       movt    a1, #:upper16:i
       ldr     a1, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:get2
       movt    a2, #:upper16:get2
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       sub     a1, a1, #48
       bl      intadd
       mov     a1, a1
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a2, a2, #1
.while_break_64:
       movw    a1, #:lower16:i
       movt    a1, #:upper16:i
       ldr     a1, [a1]
       movw    a2, #:lower16:ii
       movt    a2, #:upper16:ii
       ldr     a2, [a2]
       add     a1, a1, a2
       sub     a1, a1, #1
.if_end_63:
.if_end_56:
       movw    a1, #:lower16:i
       movt    a1, #:upper16:i
       ldr     a1, [a1]
       add     a1, a1, #1
.while_break_49:
       movs    a1, #1
       mul     a1, a1, #4
       movw    a2, #:lower16:ints
       movt    a2, #:upper16:ints
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
ints:
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
       .word    0.000000
       .word    0.000000
intt:
       .word    0
chas:
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
       .word    0.000000
       .word    0.000000
chat:
       .word    0
i:
       .word    0
ii:
       .word    1
c:
       .word    0
get:
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
       .word    0.000000
       .word    0.000000
get2:
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
       .word    0.000000
       .word    0.000000
