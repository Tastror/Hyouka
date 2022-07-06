       .text
       .global      main
init:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       movs    a2, #1
.while_continue_1:
       mul     a1, a1, a1
       add     a1, a1, #1
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, #-1
       str     a2, [a1]
       add     a2, a2, #1
.while_break_1:
       mov     v3, a1
       mov     a1, v3
       mul     a1, a1, #4
       movw    v2, #:lower16:array
       movt    v2, #:upper16:array
       ldr     v2, [v2]
       add     a1, v2, a1
       ldr     a2, [a1]
       cmp     a2, v3
       bne     .if_wrong_2
       b       .if_end_3
.if_wrong_2:
       mov     a1, v3
       mul     a1, a1, #4
       movw    v2, #:lower16:array
       movt    v2, #:upper16:array
       ldr     v2, [v2]
       add     v1, v2, a1
       mov     a1, v3
       mul     a1, a1, #4
       movw    v2, #:lower16:array
       movt    v2, #:upper16:array
       ldr     v2, [v2]
       add     a1, v2, a1
       ldr     a1, [a1]
       bl      findfa
       mov     v2, a1
       mov     a1, v2
       str     a1, [v1]
.if_end_3:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a1
       bl      findfa
       mov     a1, a1
       mov     a1, a1
       bl      findfa
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
.if_end_4:
       movs    a1, #1
.while_continue_5:
       sub     a1, a1, #1
       movs    a1, #4
       movs    a1, #10
       movs    a2, #0
       movs    a1, #0
       mov     a1, a1
       bl      init
       mov     a1, a1
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       mul     a1, a1, a1
       add     a1, a1, #1
.while_continue_6:
       cmp     a2, a1
       bge     .while_break_6
       bl      t_getint
       mov     a2, a1
       bl      t_getint
       mov     a2, a1
       sub     a2, a2, #1
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       mul     a1, a1, a2
       add     a2, a1, a2
       mov     a1, a2
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       cmp     a2, #1
       bne     .if_end_8
       movs    a1, #0
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #0
       bl      mmerge
       mov     a1, a1
.if_end_8:
       cmp     a2, a1
       bne     .if_end_9
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a2
       mov     a2, a1
       bl      mmerge
       mov     a1, a1
.if_end_9:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_10
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, #1
       bl      mmerge
       mov     a1, a1
.if_end_11:
       movs    a1, #0
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, #1
       bl      mmerge
       mov     a1, a1
.if_end_13:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_14
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       add     a2, a2, a1
       bl      mmerge
       mov     a1, a1
.if_end_15:
       movs    a1, #0
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       sub     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       movw    a1, #:lower16:n
       movt    a1, #:upper16:n
       ldr     a1, [a1]
       sub     a2, a2, a1
       bl      mmerge
       mov     a1, a1
.if_end_17:
       movs    a1, #0
       movs    a1, #0
       movs    a1, #0
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       movw    a2, #:lower16:array
       movt    a2, #:upper16:array
       ldr     a2, [a2]
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    a1, #0
       bl      findfa
       mov     a1, a1
       mov     a1, a1
       bl      findfa
       mov     a2, a1
       cmp     a1, a2
       bne     .temp_label_18
       movs    a1, #1
       movs    a1, #1
       add     a1, a2, #1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.if_end_20:
.if_end_7:
       add     a2, a2, #1
.while_break_6:
       mov     a1, #-1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.if_end_21:
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
findfa:
       push    {r7, lr}
       add     r7, sp, #0
       mov     v3, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a2, [a1]
       cmp     a2, v3
       bne     .if_wrong_2
       b       .if_end_3
.if_wrong_2:
       mov     a1, v3
       mul     a1, a1, #4
       add     v1, v2, a1
       mov     a1, v3
       mul     a1, a1, #4
       add     a1, v2, a1
       ldr     a1, [a1]
       bl      dfa
       mov     v2, a1
       mov     a1, v2
       str     a1, [v1]
.if_end_3:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a1
       bl      dfa
       mov     a1, a1
       mov     a1, a1
       bl      dfa
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
.if_end_4:
       movs    a1, #1
.while_continue_5:
       sub     a1, a1, #1
       movs    a1, #4
       movs    a1, #10
       movs    a2, #0
       movs    a1, #0
       mov     a1, a1
       bl      t
       mov     a1, a1
       mul     a1, a1, a1
       add     a1, a1, #1
.while_continue_6:
       cmp     a2, a1
       bge     .while_break_6
       bl      etint
       mov     a2, a1
       bl      etint
       mov     a2, a1
       sub     a2, a2, #1
       mul     a1, a1, a2
       add     a2, a1, a2
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       cmp     a2, #1
       bne     .if_end_8
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #0
       bl      rge
       mov     a1, a1
.if_end_8:
       cmp     a2, a1
       bne     .if_end_9
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a2
       mov     a2, a1
       bl      rge
       mov     a1, a1
.if_end_9:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_10
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, #1
       bl      rge
       mov     a1, a1
.if_end_11:
       movs    a1, #0
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, #1
       bl      rge
       mov     a1, a1
.if_end_13:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_14
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, a1
       bl      rge
       mov     a1, a1
.if_end_15:
       movs    a1, #0
       sub     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, a1
       bl      rge
       mov     a1, a1
.if_end_17:
       movs    a1, #0
       movs    a1, #0
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    a1, #0
       bl      dfa
       mov     a1, a1
       mov     a1, a1
       bl      dfa
       mov     a2, a1
       cmp     a1, a2
       bne     .temp_label_18
       movs    a1, #1
       movs    a1, #1
       add     a1, a2, #1
       mov     a1, a1
       bl      utint
       mov     a1, a1
       movs    a1, #10
       bl      utch
       mov     a1, a1
.if_end_20:
.if_end_7:
       add     a2, a2, #1
.while_break_6:
       mov     a1, #-1
       bl      utint
       mov     a1, a1
       movs    a1, #10
       bl      utch
       mov     a1, a1
.if_end_21:
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
mmerge:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       mov     a1, a1
       bl      
       mov     a1, a1
       mov     a1, a1
       bl      
       mov     a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
.if_end_4:
       movs    a1, #1
.while_continue_5:
       sub     a1, a1, #1
       movs    a1, #4
       movs    a1, #10
       movs    a2, #0
       movs    a1, #0
       mov     a1, a1
       bl      
       mov     a1, a1
       mul     a1, a1, a1
       add     a1, a1, #1
.while_continue_6:
       cmp     a2, a1
       bge     .while_break_6
       bl      nt
       mov     a2, a1
       bl      nt
       mov     a2, a1
       sub     a2, a2, #1
       mul     a1, a1, a2
       add     a2, a1, a2
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       cmp     a2, #1
       bne     .if_end_8
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #0
       bl      
       mov     a1, a1
.if_end_8:
       cmp     a2, a1
       bne     .if_end_9
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a2
       mov     a2, a1
       bl      
       mov     a1, a1
.if_end_9:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_10
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, #1
       bl      
       mov     a1, a1
.if_end_11:
       movs    a1, #0
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, #1
       bl      
       mov     a1, a1
.if_end_13:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_14
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, a1
       bl      
       mov     a1, a1
.if_end_15:
       movs    a1, #0
       sub     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, a1
       bl      
       mov     a1, a1
.if_end_17:
       movs    a1, #0
       movs    a1, #0
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    a1, #0
       bl      
       mov     a1, a1
       mov     a1, a1
       bl      
       mov     a2, a1
       cmp     a1, a2
       bne     .temp_label_18
       movs    a1, #1
       movs    a1, #1
       add     a1, a2, #1
       mov     a1, a1
       bl      nt
       mov     a1, a1
       movs    a1, #10
       bl      h
       mov     a1, a1
.if_end_20:
.if_end_7:
       add     a2, a2, #1
.while_break_6:
       mov     a1, #-1
       bl      nt
       mov     a1, a1
       movs    a1, #10
       bl      h
       mov     a1, a1
.if_end_21:
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #1
.while_continue_5:
       sub     a1, a1, #1
       movs    a1, #4
       movs    a1, #10
       movs    a2, #0
       movs    a1, #0
       mov     a1, a1
       bl      
       mov     a1, a1
       mul     a1, a1, a1
       add     a1, a1, #1
.while_continue_6:
       cmp     a2, a1
       bge     .while_break_6
       bl      
       mov     a2, a1
       bl      
       mov     a2, a1
       sub     a2, a2, #1
       mul     a1, a1, a2
       add     a2, a1, a2
       mov     a1, a2
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a2
       str     a2, [a1]
       cmp     a2, #1
       bne     .if_end_8
       movs    a1, #0
       mul     a1, a1, #4
       add     a1, a2, a1
       movs    a2, #0
       str     a2, [a1]
       mov     a1, a2
       movs    a2, #0
       bl      
       mov     a1, a1
.if_end_8:
       cmp     a2, a1
       bne     .if_end_9
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       mov     a2, a1
       str     a2, [a1]
       mov     a1, a2
       mov     a2, a1
       bl      
       mov     a1, a1
.if_end_9:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_10
       add     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, #1
       bl      
       mov     a1, a1
.if_end_11:
       movs    a1, #0
       sub     a1, a2, #1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, #1
       bl      
       mov     a1, a1
.if_end_13:
       movs    a1, #0
       cmp     a2, a1
       bge     .temp_label_14
       add     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       add     a2, a2, a1
       bl      
       mov     a1, a1
.if_end_15:
       movs    a1, #0
       sub     a1, a2, a1
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       mov     a1, a2
       sub     a2, a2, a1
       bl      
       mov     a1, a1
.if_end_17:
       movs    a1, #0
       movs    a1, #0
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #1
       movs    a1, #0
       bl      
       mov     a1, a1
       mov     a1, a1
       bl      
       mov     a2, a1
       cmp     a1, a2
       bne     .temp_label_18
       movs    a1, #1
       movs    a1, #1
       add     a1, a2, #1
       mov     a1, a1
       bl      
       mov     a1, a1
       movs    a1, #10
       bl      
       mov     a1, a1
.if_end_20:
.if_end_7:
       add     a2, a2, #1
.while_break_6:
       mov     a1, #-1
       bl      
       mov     a1, a1
       movs    a1, #10
       bl      
       mov     a1, a1
.if_end_21:
.while_break_5:
       movs    a1, #0
       pop     {r7, pc}
array:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
n:
       .word    0
