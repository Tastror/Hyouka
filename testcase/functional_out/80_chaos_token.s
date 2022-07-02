putstr:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       movs    a1, #0
.while_continue_1:
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mov     a1, a1
       bl      t_putch
       mov     a1, a1
       add     a1, a1, #1
.while_break_1:
       mov     a1, a1
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a1, v3
       bl      putstr
       mov     a1, a1
       movs    v5, #0
.while_continue_2:
       div     v6, v5, #6
       mod     v7, v5, #6
       mov     a1, v6
       mul     a1, a1, #4
       movw    v1, #:lower16:N4__mE___
       movt    v1, #:upper16:N4__mE___
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       bl      putstr
       mov     a1, a1
       mov     a1, v4
       bl      putstr
       mov     a1, a1
       mov     a1, v7
       mul     a1, a1, #4
       movw    v1, #:lower16:N4__mE___
       movt    v1, #:upper16:N4__mE___
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       bl      putstr
       mov     a1, a1
       mov     a1, v2
       bl      putstr
       mov     a1, a1
.if_end_3:
       mul     a1, v5, #17
       add     a1, a1, #23
       mod     v5, a1, #32
       cmp     v5, #0
       bne     .if_end_4
       b       .while_continue_2
.if_end_4:
.while_break_2:
       movs    a1, #0
       pop     {r7, pc}
__HELLO:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
:
       .word    87
:
       .word    101
:
       .word    108
:
       .word    99
:
       .word    111
:
       .word    109
:
       .word    101
:
       .word    32
:
       .word    116
:
       .word    111
:
       .word    32
:
       .word    116
:
       .word    104
:
       .word    101
:
       .word    32
:
       .word    74
:
       .word    97
:
       .word    112
:
       .word    97
:
       .word    114
:
       .word    105
:
       .word    32
:
       .word    80
:
       .word    97
:
       .word    114
:
       .word    107
:
       .word    33
:
       .word    10
N4__mE___:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
:
       .word    83
:
       .word    97
:
       .word    97
:
       .word    98
:
       .word    97
:
       .word    114
:
       .word    117
:
       .word    75
:
       .word    97
:
       .word    98
:
       .word    97
:
       .word    110
:
       .word    72
:
       .word    97
:
       .word    115
:
       .word    104
:
       .word    105
:
       .word    98
:
       .word    105
:
       .word    114
:
       .word    111
:
       .word    107
:
       .word    111
:
       .word    117
:
       .word    65
:
       .word    114
:
       .word    97
:
       .word    105
:
       .word    103
:
       .word    117
:
       .word    109
:
       .word    97
:
       .word    72
:
       .word    117
:
       .word    110
:
       .word    98
:
       .word    111
:
       .word    114
:
       .word    117
:
       .word    116
:
       .word    111
:
       .word    32
:
       .word    80
:
       .word    101
:
       .word    110
:
       .word    103
:
       .word    105
:
       .word    110
:
       .word    84
:
       .word    97
:
       .word    105
:
       .word    114
:
       .word    105
:
       .word    107
:
       .word    117
:
       .word    32
:
       .word    79
:
       .word    111
:
       .word    107
:
       .word    97
:
       .word    109
:
       .word    105
saY_HeI10_To:
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
       .word    0.000000
:
       .word    32
:
       .word    115
:
       .word    97
:
       .word    121
:
       .word    115
:
       .word    32
0:
       .word    104
1:
       .word    101
2:
       .word    108
3:
       .word    108
4:
       .word    111
5:
       .word    32
6:
       .word    116
7:
       .word    111
8:
       .word    32
RET:
       .word    0.000000
0:
       .word    10
