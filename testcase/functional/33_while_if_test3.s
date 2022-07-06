       .text
       .global      main
deepWhileBr:
       mov     a1, a1
       mov     a2, a2
       add     v2, a1, a2
.while_continue_1:
       cmp     v2, #75
       bge     .while_break_1
       movs    v3, #42
       cmp     v2, #100
       bge     .if_end_2
       add     v2, v2, v3
       mul     a1, v3, #2
       mul     v2, a1, #2
.if_end_4:
.if_end_3:
.if_end_2:
.while_break_1:
       mov     a1, v2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #2
       mov     a1, a1
       mov     a2, a1
       bl      deepWhileBr
       mov     a1, a1
       pop     {r7, pc}
