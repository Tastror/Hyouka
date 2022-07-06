       .text
       .global      main
main:
       sub    sp, sp, #32
       movs    v1, sp
       sub    sp, sp, #32
       movs    v2, sp
       movs    a1, #1
       str     a1, [v2]
       add     a2, v2, #4
       movs    a1, #2
       str     a1, [a2]
       add     a2, v2, #8
       movs    a1, #3
       str     a1, [a2]
       add     a2, v2, #12
       movs    a1, #4
       str     a1, [a2]
       add     a2, v2, #16
       movs    a1, #5
       str     a1, [a2]
       add     a2, v2, #20
       movs    a1, #6
       str     a1, [a2]
       add     a2, v2, #24
       movs    a1, #7
       str     a1, [a2]
       add     a2, v2, #28
       movs    a1, #8
       str     a1, [a2]
       sub    sp, sp, #32
       movs    v3, sp
       movs    a1, #1
       str     a1, [v3]
       add     a1, v3, #4
       movs    a2, #2
       str     a2, [a1]
       add     a1, v3, #16
       movs    a2, #3
       str     a2, [a1]
       add     a1, v3, #20
       movs    a2, #4
       str     a2, [a1]
       add     a1, v3, #32
       movs    a2, #5
       str     a2, [a1]
       add     a1, v3, #36
       movs    a2, #6
       str     a2, [a1]
       add     a1, v3, #48
       movs    a2, #7
       str     a2, [a1]
       add     a1, v3, #52
       movs    a2, #8
       str     a2, [a1]
       sub    sp, sp, #32
       movs    v4, sp
       movs    a1, #1
       str     a1, [v4]
       add     a1, v4, #4
       movs    a2, #2
       str     a2, [a1]
       add     a1, v4, #8
       movs    a2, #3
       str     a2, [a1]
       add     a1, v4, #16
       movs    a2, #5
       str     a2, [a1]
       add     a1, v4, #24
       movs    a2, #7
       str     a2, [a1]
       add     a1, v4, #28
       movs    a2, #8
       str     a2, [a1]
       sub    sp, sp, #32
       movs    v5, sp
       movs    a1, #2
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, v4, a1
       ldr     a1, [a2]
       mov     a1, a1
       str     a1, [v5]
       movs    a1, #2
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, v3, a1
       ldr     a1, [a2]
       add     a1, v5, #4
       mov     a2, a1
       str     a2, [a1]
       add     a1, v5, #16
       movs    a2, #3
       str     a2, [a1]
       add     a1, v5, #20
       movs    a2, #4
       str     a2, [a1]
       add     a1, v5, #32
       movs    a2, #5
       str     a2, [a1]
       add     a1, v5, #36
       movs    a2, #6
       str     a2, [a1]
       add     a1, v5, #48
       movs    a2, #7
       str     a2, [a1]
       add     a1, v5, #52
       movs    a2, #8
       str     a2, [a1]
       movs    a1, #3
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, v5, a1
       ldr     a1, [a2]
       movs    a1, #0
       mul     a1, a1, #2
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a1, v5, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #2
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a1, v5, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #2
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a1, v1, a1
       ldr     a2, [a1]
       add     a1, a1, a2
       bx      lr
