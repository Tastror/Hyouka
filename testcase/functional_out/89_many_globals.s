testParam8:
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       bx      lr
testParam16:
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       add     a1, a1, a2
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       bx      lr
testParam32:
       mov     a1, a1
       mov     a2, a2
       mov     a2, a3
       mov     a2, a4
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
       mov     a2, spill
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
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       bx      lr
main:
       push    {r7, lr}
       add     r7, sp, #0
       movs    v1, #0
       movs    v2, #1
       movs    spill, #2
       movs    spill, #3
       movs    spill, #4
       movs    spill, #5
       movs    spill, #6
       movs    spill, #7
       movs    spill, #8
       movs    spill, #9
       movs    v3, #0
       movs    v4, #1
       movs    v5, #2
       movs    v6, #3
       movs    v7, #4
       movs    spill, #5
       movs    spill, #6
       movs    spill, #7
       movs    spill, #8
       movs    spill, #9
       movs    spill, #0
       movs    spill, #1
       movs    spill, #2
       movs    spill, #3
       movs    spill, #4
       movs    spill, #5
       movs    spill, #6
       movs    spill, #7
       movs    spill, #8
       movs    spill, #9
       movs    spill, #0
       movs    spill, #1
       movs    spill, #4
       movs    spill, #5
       movs    spill, #6
       movs    spill, #7
       movs    spill, #8
       movs    spill, #9
       movs    spill, #0
       movs    spill, #1
       mov     a1, v1
       mov     a2, v2
       mov     a3, spill
       mov     a4, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       bl      testParam8
       mov     v1, a1
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       mov     a1, spill
       mov     a2, spill
       mov     a3, spill
       mov     a4, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, v3
       mov     spill, v4
       mov     spill, v5
       mov     spill, v6
       mov     spill, v7
       mov     spill, spill
       bl      testParam16
       mov     v1, a1
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       mov     a1, v1
       mov     a2, v2
       mov     a3, spill
       mov     a4, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, v3
       mov     spill, v4
       mov     spill, v5
       mov     spill, v6
       mov     spill, v7
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       bl      testParam32
       mov     v1, a1
       mov     a1, v1
       bl      t_putint
       mov     a1, a1
       movs    a1, #0
       pop     {r7, pc}
a0:
       .word    0
a1:
       .word    0
a2:
       .word    0
a3:
       .word    0
a4:
       .word    0
a5:
       .word    0
a6:
       .word    0
a7:
       .word    0
a8:
       .word    0
a9:
       .word    0
a10:
       .word    0
a11:
       .word    0
a12:
       .word    0
a13:
       .word    0
a14:
       .word    0
a15:
       .word    0
a16:
       .word    0
a17:
       .word    0
a18:
       .word    0
a19:
       .word    0
a20:
       .word    0
a21:
       .word    0
a22:
       .word    0
a23:
       .word    0
a24:
       .word    0
a25:
       .word    0
a26:
       .word    0
a27:
       .word    0
a28:
       .word    0
a29:
       .word    0
a30:
       .word    0
a31:
       .word    0
a32:
       .word    0
a33:
       .word    0
a34:
       .word    0
a35:
       .word    0
a36:
       .word    0
a37:
       .word    0
a38:
       .word    0
a39:
       .word    0
