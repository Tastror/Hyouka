       .text
       .global      main
foo:
       sub    sp, sp, #64
       movs    a2, sp
       movs    a1, #0
       str     a1, [a2]
       add     a1, a2, #4
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #8
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #12
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #16
       movs    a2, #0
       str     a2, [a1]
       add     a1, a2, #20
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #24
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #28
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #32
       movs    a2, #0
       str     a2, [a1]
       add     a1, a2, #36
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #40
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #44
       movs    a2, #3
       str     a2, [a1]
       add     a1, a2, #48
       movs    a2, #0
       str     a2, [a1]
       add     a1, a2, #52
       movs    a2, #1
       str     a2, [a1]
       add     a1, a2, #56
       movs    a2, #2
       str     a2, [a1]
       add     a1, a2, #60
       movs    a2, #3
       str     a2, [a1]
       movs    a1, #3
       movs    a2, #7
       movs    a2, #5
       movs    a2, #6
       movs    a2, #1
       movs    a2, #0
       movs    a2, #3
       movs    a2, #5
       movs    a1, #4
       movs    a2, #2
       movs    a2, #7
       movs    a2, #9
       movs    a2, #8
       movs    a2, #1
       movs    a2, #4
       movs    a2, #6
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a2, a1, a2
       add     a1, a1, a2
       mov     a1, a1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    a1, #3
       movs    a2, #7
       movs    a2, #5
       movs    a2, #6
       movs    a2, #1
       movs    a2, #0
       movs    a2, #3
       movs    a2, #5
       movs    a1, #4
       movs    a2, #2
       movs    a2, #7
       movs    a2, #9
       movs    a2, #8
       movs    a2, #1
       movs    a2, #4
       movs    a2, #6
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a2, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a3, a1, a2
       bl      foo
       mov     a1, a1
       add     a2, a2, a1
       movs    a1, #4
       movs    a2, #7
       movs    a2, #2
       movs    a2, #5
       movs    a2, #8
       movs    a2, #0
       movs    a2, #6
       movs    a2, #3
       bl      foo
       mov     a1, a1
       add     a3, a3, a1
       mov     a1, a1
       mov     a2, a2
       mov     a2, a2
       mov     a2, a2
       mov     a2, a2
       mov     a2, a2
       mov     a2, a2
       mov     a2, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a2, a1, a2
       add     a1, a2, a3
       add     a1, a1, a2
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
