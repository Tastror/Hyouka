       .text
       .global      main
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     v1, a1
       bl      t_getint
       mov     v2, a1
       bl      t_getint
       mov     v3, a1
       bl      t_getint
       mov     v4, a1
       bl      t_getint
       mov     v5, a1
       movs    v6, #0
       movs    a1, #1
       movs    a1, #1
       movw    v2, #:lower16:b
       movt    v2, #:upper16:b
       ldr     v2, [v2]
       movw    v3, #:lower16:c
       movt    v3, #:upper16:c
       ldr     v3, [v3]
       mul     a1, v2, v3
       movw    v1, #:lower16:a
       movt    v1, #:upper16:a
       ldr     v1, [v1]
       sub     a1, v1, a1
       movw    v1, #:lower16:a
       movt    v1, #:upper16:a
       ldr     v1, [v1]
       movw    v3, #:lower16:c
       movt    v3, #:upper16:c
       ldr     v3, [v3]
       div     a1, v1, v3
       movw    v4, #:lower16:d
       movt    v4, #:upper16:d
       ldr     v4, [v4]
       sub     a2, v4, a1
       movw    v1, #:lower16:a
       movt    v1, #:upper16:a
       ldr     v1, [v1]
       movw    v2, #:lower16:b
       movt    v2, #:upper16:b
       ldr     v2, [v2]
       mul     a1, v1, v2
       movw    v3, #:lower16:c
       movt    v3, #:upper16:c
       ldr     v3, [v3]
       div     a2, a1, v3
       movw    v5, #:lower16:e
       movt    v5, #:upper16:e
       ldr     v5, [v5]
       movw    v4, #:lower16:d
       movt    v4, #:upper16:d
       ldr     v4, [v4]
       add     a1, v5, v4
       cmp     a2, a1
       bne     .temp_label_2
       movs    a1, #0
       movw    v1, #:lower16:a
       movt    v1, #:upper16:a
       ldr     v1, [v1]
       movw    v2, #:lower16:b
       movt    v2, #:upper16:b
       ldr     v2, [v2]
       add     a1, v1, v2
       movw    v3, #:lower16:c
       movt    v3, #:upper16:c
       ldr     v3, [v3]
       add     a1, a1, v3
       movw    v4, #:lower16:d
       movt    v4, #:upper16:d
       ldr     v4, [v4]
       movw    v5, #:lower16:e
       movt    v5, #:upper16:e
       ldr     v5, [v5]
       add     a2, v4, v5
       cmp     a1, a2
       bne     .temp_label_1
       movs    a1, #0
       movs    v6, #1
.if_end_3:
       mov     a1, v6
       pop     {r7, pc}
a:
       .word    0
b:
       .word    0
c:
       .word    0
d:
       .word    0
e:
       .word    0
