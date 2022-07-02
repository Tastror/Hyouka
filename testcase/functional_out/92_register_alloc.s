func:
       push    {r7, lr}
       add     r7, sp, #0
       mov     spill, a1
       mov     spill, a2
       add     a1, spill, spill
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     spill, a1
       bl      t_getint
       mov     a2, a1
       add     a1, no_name, spill
       movw    v3, #:lower16:a1
       movt    v3, #:upper16:a1
       ldr     v3, [v3]
       add     a2, a1, v3
       add     a1, no_name, spill
       movw    spill, #:lower16:a2
       movt    spill, #:upper16:a2
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, spill
       movw    spill, #:lower16:a3
       movt    spill, #:upper16:a3
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a4
       movt    spill, #:upper16:a4
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a5
       movt    spill, #:upper16:a5
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a6
       movt    spill, #:upper16:a6
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a7
       movt    spill, #:upper16:a7
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a8
       movt    spill, #:upper16:a8
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a9
       movt    spill, #:upper16:a9
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    v4, #:lower16:a10
       movt    v4, #:upper16:a10
       ldr     v4, [v4]
       add     a2, a1, v4
       add     a1, no_name, a2
       movw    v5, #:lower16:a11
       movt    v5, #:upper16:a11
       ldr     v5, [v5]
       add     a2, a1, v5
       add     a1, no_name, a2
       movw    v6, #:lower16:a12
       movt    v6, #:upper16:a12
       ldr     v6, [v6]
       add     a2, a1, v6
       add     a1, no_name, a2
       movw    v7, #:lower16:a13
       movt    v7, #:upper16:a13
       ldr     v7, [v7]
       add     a2, a1, v7
       add     a1, no_name, a2
       movw    spill, #:lower16:a14
       movt    spill, #:upper16:a14
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a15
       movt    spill, #:upper16:a15
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a16
       movt    spill, #:upper16:a16
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a17
       movt    spill, #:upper16:a17
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a18
       movt    spill, #:upper16:a18
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a19
       movt    spill, #:upper16:a19
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a20
       movt    spill, #:upper16:a20
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a21
       movt    spill, #:upper16:a21
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a22
       movt    spill, #:upper16:a22
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a23
       movt    spill, #:upper16:a23
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a24
       movt    spill, #:upper16:a24
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a25
       movt    spill, #:upper16:a25
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a26
       movt    spill, #:upper16:a26
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a27
       movt    spill, #:upper16:a27
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a28
       movt    spill, #:upper16:a28
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a29
       movt    spill, #:upper16:a29
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a30
       movt    spill, #:upper16:a30
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a31
       movt    spill, #:upper16:a31
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a32
       movt    spill, #:upper16:a32
       ldr     spill, [spill]
       add     a2, a1, spill
       sub     a1, spill, spill
       add     a1, a1, #10
       add     a1, no_name, a2
       movw    spill, #:lower16:a29
       movt    spill, #:upper16:a29
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a30
       movt    spill, #:upper16:a30
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a31
       movt    spill, #:upper16:a31
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a32
       movt    spill, #:upper16:a32
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a25
       movt    spill, #:upper16:a25
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a26
       movt    spill, #:upper16:a26
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a27
       movt    spill, #:upper16:a27
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a28
       movt    spill, #:upper16:a28
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a21
       movt    spill, #:upper16:a21
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a22
       movt    spill, #:upper16:a22
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a23
       movt    spill, #:upper16:a23
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a24
       movt    spill, #:upper16:a24
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a17
       movt    spill, #:upper16:a17
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a18
       movt    spill, #:upper16:a18
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a19
       movt    spill, #:upper16:a19
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a20
       movt    spill, #:upper16:a20
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    v7, #:lower16:a13
       movt    v7, #:upper16:a13
       ldr     v7, [v7]
       add     a2, a1, v7
       add     a1, no_name, a2
       movw    spill, #:lower16:a14
       movt    spill, #:upper16:a14
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a15
       movt    spill, #:upper16:a15
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a16
       movt    spill, #:upper16:a16
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a9
       movt    spill, #:upper16:a9
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    v4, #:lower16:a10
       movt    v4, #:upper16:a10
       ldr     v4, [v4]
       add     a2, a1, v4
       add     a1, no_name, a2
       movw    v5, #:lower16:a11
       movt    v5, #:upper16:a11
       ldr     v5, [v5]
       add     a2, a1, v5
       add     a1, no_name, a2
       movw    v6, #:lower16:a12
       movt    v6, #:upper16:a12
       ldr     v6, [v6]
       add     a2, a1, v6
       add     a1, no_name, a2
       movw    spill, #:lower16:a5
       movt    spill, #:upper16:a5
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a6
       movt    spill, #:upper16:a6
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a7
       movt    spill, #:upper16:a7
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a8
       movt    spill, #:upper16:a8
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, spill
       movw    v3, #:lower16:a1
       movt    v3, #:upper16:a1
       ldr     v3, [v3]
       add     a2, a1, v3
       add     a1, no_name, spill
       movw    spill, #:lower16:a2
       movt    spill, #:upper16:a2
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, spill
       movw    spill, #:lower16:a3
       movt    spill, #:upper16:a3
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a4
       movt    spill, #:upper16:a4
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, spill
       movw    v3, #:lower16:a1
       movt    v3, #:upper16:a1
       ldr     v3, [v3]
       add     a2, a1, v3
       add     a1, no_name, spill
       movw    spill, #:lower16:a2
       movt    spill, #:upper16:a2
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, spill
       movw    spill, #:lower16:a3
       movt    spill, #:upper16:a3
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, no_name, a2
       movw    spill, #:lower16:a4
       movt    spill, #:upper16:a4
       ldr     spill, [spill]
       add     a2, a1, spill
       add     a1, a1, spill
       add     a1, a1, spill
       add     a1, a1, spill
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       sub     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       add     a1, a1, a2
       movw    v3, #:lower16:a1
       movt    v3, #:upper16:a1
       ldr     v3, [v3]
       add     a1, a1, v3
       movw    spill, #:lower16:a2
       movt    spill, #:upper16:a2
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a3
       movt    spill, #:upper16:a3
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a4
       movt    spill, #:upper16:a4
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a5
       movt    spill, #:upper16:a5
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a6
       movt    spill, #:upper16:a6
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a7
       movt    spill, #:upper16:a7
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a8
       movt    spill, #:upper16:a8
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a9
       movt    spill, #:upper16:a9
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    v4, #:lower16:a10
       movt    v4, #:upper16:a10
       ldr     v4, [v4]
       sub     a1, a1, v4
       movw    v5, #:lower16:a11
       movt    v5, #:upper16:a11
       ldr     v5, [v5]
       add     a1, a1, v5
       movw    v6, #:lower16:a12
       movt    v6, #:upper16:a12
       ldr     v6, [v6]
       sub     a1, a1, v6
       movw    v7, #:lower16:a13
       movt    v7, #:upper16:a13
       ldr     v7, [v7]
       add     a1, a1, v7
       movw    spill, #:lower16:a14
       movt    spill, #:upper16:a14
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a15
       movt    spill, #:upper16:a15
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a16
       movt    spill, #:upper16:a16
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a17
       movt    spill, #:upper16:a17
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a18
       movt    spill, #:upper16:a18
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a19
       movt    spill, #:upper16:a19
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a20
       movt    spill, #:upper16:a20
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a21
       movt    spill, #:upper16:a21
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a22
       movt    spill, #:upper16:a22
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a23
       movt    spill, #:upper16:a23
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a24
       movt    spill, #:upper16:a24
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a25
       movt    spill, #:upper16:a25
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a26
       movt    spill, #:upper16:a26
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a27
       movt    spill, #:upper16:a27
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a28
       movt    spill, #:upper16:a28
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a29
       movt    spill, #:upper16:a29
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a30
       movt    spill, #:upper16:a30
       ldr     spill, [spill]
       sub     a1, a1, spill
       movw    spill, #:lower16:a31
       movt    spill, #:upper16:a31
       ldr     spill, [spill]
       add     a1, a1, spill
       movw    spill, #:lower16:a32
       movt    spill, #:upper16:a32
       ldr     spill, [spill]
       sub     a1, a1, spill
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     a1, a1
       add     a1, a1, #18
       mov     a1, a1
       mov     a2, a1
       bl      func
       mov     a1, a1
       mov     a1, a1
       bl      t_putint
       mov     a1, a1
       mov     a1, a1
       pop     {r7, pc}
a1:
       .word    1
a2:
       .word    2
a3:
       .word    3
a4:
       .word    4
a5:
       .word    5
a6:
       .word    6
a7:
       .word    7
a8:
       .word    8
a9:
       .word    9
a10:
       .word    10
a11:
       .word    11
a12:
       .word    12
a13:
       .word    13
a14:
       .word    14
a15:
       .word    15
a16:
       .word    16
a17:
       .word    1
a18:
       .word    2
a19:
       .word    3
a20:
       .word    4
a21:
       .word    5
a22:
       .word    6
a23:
       .word    7
a24:
       .word    8
a25:
       .word    9
a26:
       .word    10
a27:
       .word    11
a28:
       .word    12
a29:
       .word    13
a30:
       .word    14
a31:
       .word    15
a32:
       .word    16
