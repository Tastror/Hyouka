       .text
       .global      main
EightWhile:
       movs    v5, #5
       movs    v6, #6
       movs    v7, #7
       movs    spill, #10
.while_continue_1:
       cmp     v5, #20
       bge     .while_break_1
       add     v5, v5, #3
.while_continue_2:
       cmp     v6, #10
       bge     .while_break_2
       add     v6, v6, #1
.while_continue_3:
       cmp     v7, #7
       bne     .while_break_3
       sub     v7, v7, #1
.while_continue_4:
       cmp     spill, #20
       bge     .while_break_4
       add     spill, spill, #3
.while_continue_5:
       movw    v1, #:lower16:e
       movt    v1, #:upper16:e
       ldr     v1, [v1]
       sub     v1, v1, #1
.while_continue_6:
       movw    v2, #:lower16:f
       movt    v2, #:upper16:f
       ldr     v2, [v2]
       sub     v2, v2, #2
.while_continue_7:
       cmp     v3, #3
       bge     .while_break_7
       movw    v3, #:lower16:g
       movt    v3, #:upper16:g
       ldr     v3, [v3]
       add     v3, v3, #10
.while_continue_8:
       cmp     v4, #10
       bge     .while_break_8
       movw    v4, #:lower16:h
       movt    v4, #:upper16:h
       ldr     v4, [v4]
       add     v4, v4, #8
.while_break_8:
       movw    v4, #:lower16:h
       movt    v4, #:upper16:h
       ldr     v4, [v4]
       sub     v4, v4, #1
.while_break_7:
       movw    v3, #:lower16:g
       movt    v3, #:upper16:g
       ldr     v3, [v3]
       sub     v3, v3, #8
.while_break_6:
       movw    v2, #:lower16:f
       movt    v2, #:upper16:f
       ldr     v2, [v2]
       add     v2, v2, #1
.while_break_5:
       movw    v1, #:lower16:e
       movt    v1, #:upper16:e
       ldr     v1, [v1]
       add     v1, v1, #1
.while_break_4:
       sub     spill, spill, #1
.while_break_3:
       add     v7, v7, #1
.while_break_2:
       sub     v6, v6, #2
.while_break_1:
       add     a1, v6, spill
       add     a1, v5, a1
       add     a2, a1, v7
       movw    v1, #:lower16:e
       movt    v1, #:upper16:e
       ldr     v1, [v1]
       add     a1, v1, spill
       movw    v3, #:lower16:g
       movt    v3, #:upper16:g
       ldr     v3, [v3]
       sub     a1, a1, v3
       movw    v4, #:lower16:h
       movt    v4, #:upper16:h
       ldr     v4, [v4]
       add     a1, a1, v4
       sub     a1, a2, a1
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #1
       movs    a1, #2
       movs    a1, #4
       movs    a1, #6
       bl      EightWhile
       mov     a1, a1
       pop     {r7, pc}
g:
       .word    0
h:
       .word    0
f:
       .word    0
e:
       .word    0
