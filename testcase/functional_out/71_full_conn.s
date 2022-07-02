relu_reg:
       mov     a1, a1
.if_end_1:
       cmp     a1, #0
       bge     .if_end_2
.if_end_2:
       mov     a1, a1
       bx      lr
model:
       push    {r7, lr}
       add     r7, sp, #0
       mov     a2, a1
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #85
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #23
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-82
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-103
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-123
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #64
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-120
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #50
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-59
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #47
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-111
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-67
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-106
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-75
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-102
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #34
       add     a2, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-39
       add     a2, a2, a1
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #65
       add     a2, a2, a1
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #47
       add     a2, a2, a1
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #113
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #110
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #47
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-4
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #80
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #46
       add     a1, a2, a1
       bl      relu_reg
       mov     a1, a1
       mul     a1, a1, #39
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-106
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #126
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-18
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-31
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-8
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #47
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-4
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #67
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-94
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-121
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #7
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-21
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-60
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-43
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #105
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-42
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #87
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #29
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-106
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-31
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-110
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-100
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-22
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-75
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-125
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a2, a1, #77
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #26
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #76
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-70
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #29
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-95
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #96
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #52
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-68
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-5
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #34
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-34
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #102
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #6
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-38
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #27
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #110
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #116
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #39
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-63
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-99
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #65
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #120
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-39
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-6
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #94
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a2, a1, #127
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-23
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-63
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #49
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #50
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #72
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #85
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-30
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #12
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #125
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-117
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-65
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-67
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #125
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #110
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-31
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-123
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #83
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #122
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #11
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-23
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-47
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-32
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-117
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #95
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #118
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a2, a1, #-106
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #8
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #82
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-104
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #101
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-116
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-63
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-16
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-70
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #125
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #75
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #66
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-96
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-101
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-114
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #59
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #12
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #5
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-95
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #116
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-93
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #15
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #79
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #3
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #49
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-124
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a2, a1, #-3
       add     a2, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #81
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #68
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-102
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-74
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #121
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-15
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #55
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #101
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-13
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-62
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #64
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #114
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #38
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-21
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #112
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #114
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #112
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-10
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-16
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-50
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-112
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-116
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-54
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #82
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-72
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a1, a1, #32
       add     a2, a2, a1
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #15
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-77
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #66
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-90
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-6
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-30
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-8
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #81
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #2
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-110
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-95
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #59
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #52
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #15
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #55
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-33
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #14
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #58
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #67
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #86
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-79
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #48
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-13
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-15
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #66
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a1, a1, #-95
       add     a1, a2, a1
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #33
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #82
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #67
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #30
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-2
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #65
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #120
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-13
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #18
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #5
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #104
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-119
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-7
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #71
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #107
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #24
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #82
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-96
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-104
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-121
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #65
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a1, a2, a1
       ldr     a2, [a1]
       mul     a2, a2, #97
       add     a2, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #83
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #46
       add     a2, a2, a1
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-84
       add     a1, a2, a1
       bl      relu_reg
       mov     a1, a1
       mul     a2, a1, #-50
       add     a2, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #-29
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #7
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-70
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #38
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-90
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-15
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-32
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #37
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #36
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-62
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-125
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-46
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-70
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #37
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-73
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-34
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-87
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-75
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #71
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-77
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #53
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #37
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-103
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-13
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-114
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a1, a1, #-23
       add     a2, a2, a1
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a1, a1, #67
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #42
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #41
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-123
       add     a1, a1, a2
       movs    a1, #0
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-92
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #10
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-77
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #75
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #96
       add     a1, a1, a2
       movs    a1, #1
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-51
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #109
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-74
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-7
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-122
       add     a1, a1, a2
       movs    a1, #2
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #67
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #47
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #22
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-68
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #38
       add     a1, a1, a2
       movs    a1, #3
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #29
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #0
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #115
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #1
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-121
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #2
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #36
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #3
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #-49
       add     a1, a1, a2
       movs    a1, #4
       mul     a1, a1, #5
       add     a1, a1, #4
       mul     a1, a1, #4
       add     a2, a2, a1
       ldr     a1, [a2]
       mul     a2, a1, #85
       add     a1, a1, a2
       bl      relu_reg
       mov     a1, a1
       mul     a1, a1, #46
       add     a1, a2, a1
.if_end_3:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      t_getint
       mov     v2, a1
       sub    sp, sp, #100
       movs    v3, sp
.while_continue_4:
       movs    v4, #0
.while_continue_5:
       cmp     v4, #5
       bge     .while_break_5
       movs    v5, #0
.while_continue_6:
       cmp     v5, #5
       bge     .while_break_6
       mov     a1, v4
       mul     a1, a1, #5
       add     a1, a1, v5
       mul     a1, a1, #4
       add     v1, v3, a1
       bl      t_getint
       mov     v3, a1
       mov     a1, v3
       str     a1, [v1]
       add     v5, v5, #1
.while_break_6:
       add     v4, v4, #1
.while_break_5:
       mov     a1, v3
       bl      model
       mov     a1, a1
       movs    a1, #99
       bl      t_putch
       mov     a1, a1
       movs    a1, #97
       bl      t_putch
       mov     a1, a1
       movs    a1, #116
       bl      t_putch
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       b       .if_end_8
.if_wrong_7:
       movs    a1, #100
       bl      t_putch
       mov     a1, a1
       movs    a1, #111
       bl      t_putch
       mov     a1, a1
       movs    a1, #103
       bl      t_putch
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
.if_end_8:
       sub     v2, v2, #1
.while_break_4:
       movs    a1, #0
       pop     {r7, pc}
