       .text
       .global      main
main2:
       mov     a1, a1
       mov     a1, a2
       mov     a2, a3
       movs    a1, #1
       movs    a2, #5
       mul     a1, a1, a2
       add     a1, a1, #2
       add     a1, a2, a1
       movs    a1, #1
       movs    a2, #5
       mul     a1, a1, a2
       add     a1, a1, #2
       add     a2, a2, a1
       ldr     a1, [a2]
       add     a2, a1, #1
       mov     a2, a2
       str     a2, [a1]
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       str     a1, [v5]
       add     a2, v5, #4
       movs    a1, #2
       str     a1, [a2]
       add     a2, v5, #8
       movs    a1, #3
       str     a1, [a2]
       add     a2, v5, #20
       movs    a1, #1
       str     a1, [a2]
       add     a2, v5, #24
       movs    a1, #5
       str     a1, [a2]
       movs    a1, #0
       add     a1, spill, a1
       mvn     a2, #1717986917
       str     a2, [a1]
       mov     a1, #-1
       add     a1, spill, a1
       movs    a2, #2061584302
       str     a2, [a1]
       movs    a1, #1
       movs    a2, #10
       mul     a1, a1, a2
       add     a1, a1, #2
       movw    v3, #:lower16:a
       movt    v3, #:upper16:a
       ldr     v3, [v3]
       add     a1, v3, a1
       movs    a2, #3
       str     a2, [a1]
.while_continue_1:
       cmp     v7, #20
       bge     .while_break_1
       add     v7, v7, #1
       mov     a1, v7
       add     a1, spill, a1
       sub     a1, v7, #1
       mov     a1, a1
       add     a2, spill, a1
       ldr     a1, [a2]
       sub     a1, v7, #2
       mov     a1, a1
       add     a1, spill, a1
       ldr     a2, [a1]
       add     spill, a1, a2
       mov     a2, spill
       str     a2, [a1]
       mov     a1, v7
       add     a2, spill, a1
       ldr     a1, [a2]
       b       .while_continue_1
       b       .if_end_3
.if_wrong_2:
       b       .while_break_1
.if_end_3:
.while_break_1:
       movs    a1, #5
       add     a1, a1, #1
       b       .if_end_5
.if_wrong_4:
       sub     v7, v7, #50
.if_end_5:
       movs    a1, #1
       cmp     v7, #0
       bge     .temp_label_6
       movs    a1, #3
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a3, v5
       bl      main2
       mov     a1, a1
       movs    a1, #0
.temp_label_6:
.if_end_7:
       movs    a1, #3
       add     a2, spill, a1
       ldr     a1, [a2]
       mov     a3, v5
       bl      main2
       mov     a1, a1
       mov     a1, v4
       mvn     a1, #1717986917
       movs    a1, #1205
       add     a1, no_name, a1
       sub    sp, sp, #5808100
       movs    v6, sp
       movs    a1, #0
       str     a1, [v6]
       add     a1, v6, #4
       movs    a2, #1
       str     a2, [a1]
       add     a1, v6, #8
       movs    a2, #2
       str     a2, [a1]
       movs    a1, #1205
       pop     {r7, pc}
a:
Maxn:
       .word    10005
