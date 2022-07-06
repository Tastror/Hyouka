       .text
       .global      main
read_program:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #0
       bl      t_getint
       mov     a2, a1
.while_continue_1:
       cmp     a1, a2
       bge     .while_break_1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:program
       movt    a2, #:upper16:program
       ldr     a2, [a2]
       add     a1, a2, a1
       bl      t_getch
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a1, a1, #1
.while_break_1:
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:program
       movt    a2, #:upper16:program
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     v6, a1
       movs    v5, #0
.while_continue_2:
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #62
       bne     .if_wrong_3
       movw    v2, #:lower16:ptr
       movt    v2, #:upper16:ptr
       ldr     v2, [v2]
       add     v2, v2, #1
       b       .if_end_4
.if_wrong_3:
       cmp     v4, #60
       bne     .if_wrong_5
       movw    v2, #:lower16:ptr
       movt    v2, #:upper16:ptr
       ldr     v2, [v2]
       sub     v2, v2, #1
       b       .if_end_6
.if_wrong_5:
       cmp     v4, #43
       bne     .if_wrong_7
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a1, v3, a1
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a2, v3, a1
       ldr     a1, [a2]
       add     v3, a1, #1
       mov     a2, v3
       str     a2, [a1]
       b       .if_end_8
.if_wrong_7:
       cmp     v4, #45
       bne     .if_wrong_9
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a1, v3, a1
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a2, v3, a1
       ldr     a1, [a2]
       sub     v3, a1, #1
       mov     a2, v3
       str     a2, [a1]
       b       .if_end_10
.if_wrong_9:
       cmp     v4, #46
       bne     .if_wrong_11
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a1, v3, a1
       ldr     a1, [a1]
       mov     a1, a1
       bl      t_putch
       mov     a1, a1
       b       .if_end_12
.if_wrong_11:
       cmp     v4, #44
       bne     .if_wrong_13
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     v1, v3, a1
       bl      t_getch
       mov     v3, a1
       mov     a1, v3
       str     a1, [v1]
       b       .if_end_14
.if_wrong_13:
       movs    a1, #0
       cmp     v4, #93
       bne     .temp_label_15
       mov     a1, v2
       mul     a1, a1, #4
       movw    v3, #:lower16:tape
       movt    v3, #:upper16:tape
       ldr     v3, [v3]
       add     a2, v3, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    v7, #1
.while_continue_17:
       sub     v5, v5, #1
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #91
       bne     .if_wrong_18
       sub     v7, v7, #1
       b       .if_end_19
.if_wrong_18:
       cmp     v4, #93
       bne     .if_end_20
       add     v7, v7, #1
.if_end_20:
.if_end_19:
.while_break_17:
.if_end_16:
.if_end_14:
.if_end_12:
.if_end_10:
.if_end_8:
.if_end_6:
.if_end_4:
       add     v5, v5, #1
.while_break_2:
       bl      read_program
       mov     a1, a1
       mov     a1, a1
       bl      interpret
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
interpret:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v6, a1
       movs    v5, #0
.while_continue_2:
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     a2, [a1]
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #62
       bne     .if_wrong_3
       add     v2, v2, #1
       b       .if_end_4
.if_wrong_3:
       cmp     v4, #60
       bne     .if_wrong_5
       sub     v2, v2, #1
       b       .if_end_6
.if_wrong_5:
       cmp     v4, #43
       bne     .if_wrong_7
       mov     a1, v2
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a1, v2
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       add     v3, a1, #1
       mov     a2, v3
       str     a2, [a1]
       b       .if_end_8
.if_wrong_7:
       cmp     v4, #45
       bne     .if_wrong_9
       mov     a1, v2
       mul     a1, a1, #4
       add     a1, v3, a1
       mov     a1, v2
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       sub     v3, a1, #1
       mov     a2, v3
       str     a2, [a1]
       b       .if_end_10
.if_wrong_9:
       cmp     v4, #46
       bne     .if_wrong_11
       mov     a1, v2
       mul     a1, a1, #4
       add     a1, v3, a1
       ldr     a1, [a1]
       mov     a1, a1
       bl      utch
       mov     a1, a1
       b       .if_end_12
.if_wrong_11:
       cmp     v4, #44
       bne     .if_wrong_13
       mov     a1, v2
       mul     a1, a1, #4
       add     v1, v3, a1
       bl      etch
       mov     v3, a1
       mov     a1, v3
       str     a1, [v1]
       b       .if_end_14
.if_wrong_13:
       movs    a1, #0
       cmp     v4, #93
       bne     .temp_label_15
       mov     a1, v2
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    v7, #1
.while_continue_17:
       sub     v5, v5, #1
       mov     a1, v5
       mul     a1, a1, #4
       add     a1, v6, a1
       ldr     v4, [a1]
       cmp     v4, #91
       bne     .if_wrong_18
       sub     v7, v7, #1
       b       .if_end_19
.if_wrong_18:
       cmp     v4, #93
       bne     .if_end_20
       add     v7, v7, #1
.if_end_20:
.if_end_19:
.while_break_17:
.if_end_16:
.if_end_14:
.if_end_12:
.if_end_10:
.if_end_8:
.if_end_6:
.if_end_4:
       add     v5, v5, #1
.while_break_2:
       bl      d_program
       mov     a1, a1
       mov     a1, a1
       bl      erpret
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      rogram
       mov     a1, a1
       mov     a1, a1
       bl      ret
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
TAPE_LEN:
       .word    65536
BUFFER_LEN:
       .word    32768
tape:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
program:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
ptr:
       .word    0
