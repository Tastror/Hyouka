func1:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       cmp     a1, #0
       bne     .if_wrong_1
       b       .if_end_2
.if_wrong_1:
.if_end_2:
       mov     a1, a1
       mov     a1, a2
       b       .if_end_4
.if_wrong_3:
.if_end_4:
       mov     a1, a1
       mov     a1, a2
       cmp     a1, #0
       bne     .if_wrong_5
       b       .if_end_6
.if_wrong_5:
.if_end_6:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       b       .if_end_8
.if_wrong_7:
.if_end_8:
       mov     a1, a1
       sub     a1, no_name, a1
       bx      lr
func2:
       mov     a1, a1
       mov     a1, a2
       b       .if_end_4
.if_wrong_3:
.if_end_4:
       mov     a1, a1
       mov     a1, a2
       cmp     a1, #0
       bne     .if_wrong_5
       b       .if_end_6
.if_wrong_5:
.if_end_6:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       b       .if_end_8
.if_wrong_7:
.if_end_8:
       mov     a1, a1
       sub     a1, no_name, a1
       bx      lr
func3:
       mov     a1, a1
       mov     a1, a2
       cmp     a1, #0
       bne     .if_wrong_5
       b       .if_end_6
.if_wrong_5:
.if_end_6:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       b       .if_end_8
.if_wrong_7:
.if_end_8:
       mov     a1, a1
       sub     a1, no_name, a1
       bx      lr
func4:
       mov     a1, a1
       mov     a1, a2
       mov     a1, a3
       b       .if_end_8
.if_wrong_7:
.if_end_8:
       mov     a1, a1
       sub     a1, no_name, a1
       bx      lr
func5:
       mov     a1, a1
       sub     a1, no_name, a1
       bx      lr
func6:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       mov     a1, a2
       movs    a1, #0
       movs    a1, #1
       b       .if_end_11
.if_wrong_10:
.if_end_11:
       mov     a1, a1
       b       .if_end_13
.if_wrong_12:
.if_end_13:
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       bl      t_getint
       mov     a1, a1
       sub    sp, sp, #40
       movs    a2, sp
       movs    a1, #0
.while_continue_14:
       cmp     a1, #10
       bge     .while_break_14
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       bl      t_getint
       mov     a2, a1
       mov     a1, a2
       str     a1, [a2]
       add     a1, a1, #1
.while_break_14:
       mov     a1, a1
       bl      func7
       mov     a1, a1
       mov     a1, a1
       bl      func5
       mov     a2, a1
       bl      func6
       mov     a1, a1
       mov     a2, a1
       bl      func2
       mov     a1, a1
       mov     a2, a1
       bl      func3
       mov     a1, a1
       bl      func5
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func5
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func7
       mov     a2, a1
       bl      func6
       mov     a2, a1
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func7
       mov     a2, a1
       bl      func2
       mov     a3, a1
       bl      func4
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      func3
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      func2
       mov     a1, a1
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func7
       mov     a2, a1
       bl      func3
       mov     a2, a1
       mov     a3, a1
       bl      func1
       mov     a3, a1
       bl      func4
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bl      func7
       mov     a1, a1
       mov     a2, a1
       bl      func3
       mov     a2, a1
       bl      func2
       mov     a2, a1
       bl      func3
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a3, [a2]
       bl      func1
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      func2
       mov     a1, a1
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func5
       mov     a2, a1
       bl      func3
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func5
       mov     a2, a1
       bl      func2
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func7
       mov     a3, a1
       bl      func1
       mov     a1, a1
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      func5
       mov     a2, a1
       bl      func2
       mov     a1, a1
       mov     a2, a1
       bl      func3
       mov     a3, a1
       bl      func1
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
func7:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       b       .if_end_13
.if_wrong_12:
.if_end_13:
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       bl      etint
       mov     a1, a1
       sub    sp, sp, #40
       movs    a2, sp
       movs    a1, #0
.while_continue_14:
       cmp     a1, #10
       bge     .while_break_14
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       bl      etint
       mov     a2, a1
       mov     a1, a2
       str     a1, [a2]
       add     a1, a1, #1
.while_break_14:
       mov     a1, a1
       bl      c7
       mov     a1, a1
       mov     a1, a1
       bl      c5
       mov     a2, a1
       bl      c6
       mov     a1, a1
       mov     a2, a1
       bl      c2
       mov     a1, a1
       mov     a2, a1
       bl      c3
       mov     a1, a1
       bl      c5
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c5
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c7
       mov     a2, a1
       bl      c6
       mov     a2, a1
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c7
       mov     a2, a1
       bl      c2
       mov     a3, a1
       bl      c4
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      c3
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      c2
       mov     a1, a1
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c7
       mov     a2, a1
       bl      c3
       mov     a2, a1
       mov     a3, a1
       bl      c1
       mov     a3, a1
       bl      c4
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bl      c7
       mov     a1, a1
       mov     a2, a1
       bl      c3
       mov     a2, a1
       bl      c2
       mov     a2, a1
       bl      c3
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a3, [a2]
       bl      c1
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      c2
       mov     a1, a1
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c5
       mov     a2, a1
       bl      c3
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c5
       mov     a2, a1
       bl      c2
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c7
       mov     a3, a1
       bl      c1
       mov     a1, a1
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      c5
       mov     a2, a1
       bl      c2
       mov     a1, a1
       mov     a2, a1
       bl      c3
       mov     a3, a1
       bl      c1
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      nt
       mov     a1, a1
       bl      nt
       mov     a1, a1
       bl      nt
       mov     a1, a1
       bl      nt
       mov     a1, a1
       sub    sp, sp, #40
       movs    a2, sp
       movs    a1, #0
.while_continue_14:
       cmp     a1, #10
       bge     .while_break_14
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       bl      nt
       mov     a2, a1
       mov     a1, a2
       str     a1, [a2]
       add     a1, a1, #1
.while_break_14:
       mov     a1, a1
       bl      
       mov     a1, a1
       mov     a1, a1
       bl      
       mov     a2, a1
       bl      
       mov     a1, a1
       mov     a2, a1
       bl      
       mov     a1, a1
       mov     a2, a1
       bl      
       mov     a1, a1
       bl      
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a2, a1
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a3, a1
       bl      
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      
       mov     a1, a1
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a2, a1
       mov     a3, a1
       bl      
       mov     a3, a1
       bl      
       mov     a1, a1
       mov     a1, a1
       mov     a1, a1
       bl      
       mov     a1, a1
       mov     a2, a1
       bl      
       mov     a2, a1
       bl      
       mov     a2, a1
       bl      
       mov     a1, a1
       movs    a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a3, [a2]
       bl      
       mov     a1, a1
       movs    a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       bl      
       mov     a1, a1
       movs    a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       movs    a1, #5
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a1, a1
       movs    a1, #6
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a1, a1
       movs    a1, #7
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a2, [a2]
       movs    a1, #8
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a3, a1
       bl      
       mov     a1, a1
       movs    a1, #9
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       bl      
       mov     a2, a1
       bl      
       mov     a1, a1
       mov     a2, a1
       bl      
       mov     a3, a1
       bl      
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
