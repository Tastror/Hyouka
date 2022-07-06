       .text
       .global      main
doubleWhile:
       movs    v1, #5
       movs    v2, #7
.while_continue_1:
       cmp     v1, #100
       bge     .while_break_1
       add     v1, v1, #30
.while_continue_2:
       cmp     v2, #100
       bge     .while_break_2
       add     v2, v2, #6
.while_break_2:
       sub     v2, v2, #100
.while_break_1:
       mov     a1, v2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      doubleWhile
       mov     a1, a1
       pop     {r7, pc}
