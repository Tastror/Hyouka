       .text
       .global      main
func:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, a1
       movw    v2, #:lower16:g
       movt    v2, #:upper16:g
       ldr     v2, [v2]
       add     v2, v2, a1
       mov     a1, v2
       bl      t_putint
       mov     a1, a1
       mov     a1, v2
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     a1, a1
       movs    a1, #0
       mov     a1, a1
       bl      func
       mov     a1, a1
       movs    a1, #1
       movs    a1, #1
       b       .if_end_3
.if_wrong_2:
       movs    a1, #0
.if_end_3:
       bl      t_getint
       mov     a1, a1
       movs    a1, #0
       mov     a1, a1
       bl      func
       mov     a1, a1
       movs    a1, #1
       movs    a1, #1
       b       .if_end_6
.if_wrong_5:
       movs    a1, #0
.if_end_6:
       bl      t_getint
       mov     a1, a1
       movs    a1, #1
       mov     a1, a1
       bl      func
       mov     a1, a1
       movs    a1, #0
       movs    a1, #1
       b       .if_end_9
.if_wrong_8:
       movs    a1, #0
.if_end_9:
       bl      t_getint
       mov     a1, a1
       movs    a1, #1
       mov     a1, a1
       bl      func
       mov     a1, a1
       movs    a1, #0
       movs    a1, #1
       b       .if_end_12
.if_wrong_11:
       movs    a1, #0
.if_end_12:
       movs    a1, #0
       movs    a1, #99
       bl      func
       mov     a1, a1
       movs    a1, #100
       bl      func
       mov     a1, a1
       movs    a1, #1
       movs    a1, #1
       b       .if_end_15
.if_wrong_14:
       movs    a1, #0
.if_end_15:
       movs    a1, #0
       pop     {r7, pc}
g:
       .word    0
