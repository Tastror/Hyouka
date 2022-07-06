       .text
       .global      main
Dijkstra:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v5, #1
.while_continue_1:
       mov     a1, v5
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a1, v2, a1
       movs    a1, #1
       mul     a1, a1, #16
       add     a1, a1, v5
       mul     a1, a1, #4
       movw    v3, #:lower16:e
       movt    v3, #:upper16:e
       ldr     v3, [v3]
       add     a1, v3, a1
       ldr     v2, [a1]
       mov     a2, v2
       str     a2, [a1]
       mov     a1, v5
       mul     a1, a1, #4
       movw    v1, #:lower16:book
       movt    v1, #:upper16:book
       ldr     v1, [v1]
       add     a1, v1, a1
       movs    a2, #0
       str     a2, [a1]
       add     v5, v5, #1
.while_break_1:
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:book
       movt    v1, #:upper16:book
       ldr     v1, [v1]
       add     a1, v1, a1
       movs    a2, #1
       str     a2, [a1]
       movs    v5, #1
.while_continue_2:
       movw    v4, #:lower16:n
       movt    v4, #:upper16:n
       ldr     v4, [v4]
       sub     a1, v4, #1
       movs    spill, #65535
       movs    v7, #0
       movs    v6, #1
.while_continue_3:
       movs    a1, #0
       mov     a1, v6
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, v6
       mul     a1, a1, #4
       movw    v1, #:lower16:book
       movt    v1, #:upper16:book
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       cmp     a1, #0
       bne     .temp_label_4
       movs    a1, #1
       mov     a1, v6
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a1, v2, a1
       ldr     spill, [a1]
       mov     v7, v6
.if_end_5:
       add     v6, v6, #1
.while_break_3:
       mov     a1, v7
       mul     a1, a1, #4
       movw    v1, #:lower16:book
       movt    v1, #:upper16:book
       ldr     v1, [v1]
       add     a1, v1, a1
       movs    a2, #1
       str     a2, [a1]
       movs    v6, #1
.while_continue_6:
       mov     a1, v6
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, v7
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, v7
       mul     a1, a1, #16
       add     a1, a1, v6
       mul     a1, a1, #4
       movw    v3, #:lower16:e
       movt    v3, #:upper16:e
       ldr     v3, [v3]
       add     a1, v3, a1
       ldr     a2, [a1]
       add     a2, a1, a2
       mov     a1, v6
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a1, v2, a1
       mov     a1, v7
       mul     a1, a1, #4
       movw    v2, #:lower16:dis
       movt    v2, #:upper16:dis
       ldr     v2, [v2]
       add     a2, v2, a1
       ldr     a1, [a2]
       mov     a1, v7
       mul     a1, a1, #16
       add     a1, a1, v6
       mul     a1, a1, #4
       movw    v3, #:lower16:e
       movt    v3, #:upper16:e
       ldr     v3, [v3]
       add     a1, v3, a1
       ldr     a2, [a1]
       add     v2, a1, a2
       mov     a2, v2
       str     a2, [a1]
.if_end_8:
.if_end_7:
       add     v6, v6, #1
.while_break_6:
       add     v5, v5, #1
.while_break_2:
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       movs    a2, #1
.while_continue_9:
       movs    a2, #1
.while_continue_10:
       cmp     a2, a2
       bne     .if_wrong_11
       mov     a1, a2
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:e
       movt    a2, #:upper16:e
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       b       .if_end_12
.if_wrong_11:
       mov     a1, a2
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:e
       movt    a2, #:upper16:e
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #65535
       str     a2, [a1]
.if_end_12:
       add     a2, a2, #1
.while_break_10:
       add     a2, a2, #1
.while_break_9:
       movs    a2, #1
.while_continue_13:
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:e
       movt    a2, #:upper16:e
       ldr     a2, [a2]
       add     a1, a2, a1
       bl      t_getint
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_13:
       bl      Dijkstra
       mov     a1, a1
       movs    a2, #1
.while_continue_14:
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:dis
       movt    a2, #:upper16:dis
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #32
       bl      t_putch
       mov     a1, a1
       add     a2, a2, #1
.while_break_14:
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
       movs    a2, #1
.while_continue_9:
       movs    a2, #1
.while_continue_10:
       cmp     a2, a2
       bne     .if_wrong_11
       mov     a1, a2
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       b       .if_end_12
.if_wrong_11:
       mov     a1, a2
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #65535
       str     a2, [a1]
.if_end_12:
       add     a2, a2, #1
.while_break_10:
       add     a2, a2, #1
.while_break_9:
       movs    a2, #1
.while_continue_13:
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #16
       add     a1, a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       bl      etint
       mov     a2, a1
       mov     a2, a2
       str     a2, [a1]
       add     a2, a2, #1
.while_break_13:
       bl      kstra
       mov     a1, a1
       movs    a2, #1
.while_continue_14:
       mov     a1, a2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      utint
       mov     a1, a1
       movs    a1, #32
       bl      utch
       mov     a1, a1
       add     a2, a2, #1
.while_break_14:
       movs    a1, #10
       bl      utch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
INF:
       .word    65535
e:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
book:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
dis:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
n:
       .word    0
m:
       .word    0
v1:
       .word    0
v2:
       .word    0
w:
       .word    0
