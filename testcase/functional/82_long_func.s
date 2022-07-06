       .text
       .global      main
long_func:
       push    {r7, lr}
       add     r7, sp, #0
       movs    spill, #2
       movs    spill, #0
       movs    spill, #1
.while_continue_1:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_2:
       cmp     spill, #16
       bge     .while_break_2
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_4:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_2:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_6:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_7:
       cmp     spill, #16
       bge     .while_break_7
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_9:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_7:
       mov     v6, spill
       mov     v7, spill
.while_continue_11:
       movs    spill, #0
       movs    spill, #0
       mov     spill, v6
       mov     spill, v7
.while_continue_12:
       cmp     spill, #16
       bge     .while_break_12
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_15
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_15:
       b       .if_end_14
.if_wrong_13:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_16:
.if_end_14:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_12:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, v6
       mov     spill, v7
.while_continue_17:
       cmp     spill, #16
       bge     .while_break_17
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_19:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_17:
       mov     v7, spill
       movs    spill, #0
       b       .if_end_21
.if_wrong_20:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, v7, a1
       movs    spill, #65535
.while_continue_22:
       cmp     spill, #16
       bge     .while_break_22
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_24:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_22:
.if_end_21:
       mov     v7, spill
       mov     v6, spill
.while_break_11:
       mov     spill, v6
       mov     spill, spill
.if_end_10:
       mov     spill, spill
       mov     spill, spill
.while_continue_25:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_26:
       cmp     spill, #16
       bge     .while_break_26
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_29
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_29:
       b       .if_end_28
.if_wrong_27:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_30:
.if_end_28:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_26:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_31:
       cmp     spill, #16
       bge     .while_break_31
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_33:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_31:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_35
.if_wrong_34:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_36:
       cmp     spill, #16
       bge     .while_break_36
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_38:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_36:
.if_end_35:
       mov     spill, spill
       mov     spill, spill
.while_break_25:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_41
       movs    spill, #65535
       b       .if_end_42
.if_wrong_41:
       movs    spill, #0
.if_end_42:
       b       .if_end_40
.if_wrong_39:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_46
.if_wrong_45:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_46:
       b       .if_end_44
.if_wrong_43:
       mov     spill, spill
.if_end_44:
.if_end_40:
       mov     spill, spill
.while_break_6:
       mov     spill, spill
       mov     spill, spill
.if_end_5:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_47:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_48:
       cmp     spill, #16
       bge     .while_break_48
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_50:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_48:
       mov     spill, spill
       mov     spill, spill
.while_continue_52:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_53:
       cmp     spill, #16
       bge     .while_break_53
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_56
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_56:
       b       .if_end_55
.if_wrong_54:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_57:
.if_end_55:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_53:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_58:
       cmp     spill, #16
       bge     .while_break_58
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_60:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_58:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_62
.if_wrong_61:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_63:
       cmp     spill, #16
       bge     .while_break_63
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_65:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_63:
.if_end_62:
       mov     spill, spill
       mov     spill, spill
.while_break_52:
       mov     spill, spill
       mov     spill, spill
.if_end_51:
       mov     spill, spill
       mov     spill, spill
.while_continue_66:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_67:
       cmp     spill, #16
       bge     .while_break_67
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_70
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_70:
       b       .if_end_69
.if_wrong_68:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_71:
.if_end_69:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_67:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_72:
       cmp     spill, #16
       bge     .while_break_72
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_74:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_72:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_76
.if_wrong_75:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_77:
       cmp     spill, #16
       bge     .while_break_77
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_79:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_77:
.if_end_76:
       mov     spill, spill
       mov     spill, spill
.while_break_66:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_82
       movs    spill, #65535
       b       .if_end_83
.if_wrong_82:
       movs    spill, #0
.if_end_83:
       b       .if_end_81
.if_wrong_80:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_87
.if_wrong_86:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_87:
       b       .if_end_85
.if_wrong_84:
       mov     spill, spill
.if_end_85:
.if_end_81:
       mov     spill, spill
.while_break_47:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_90
       movs    spill, #65535
       b       .if_end_91
.if_wrong_90:
       movs    spill, #0
.if_end_91:
       b       .if_end_89
.if_wrong_88:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_95
.if_wrong_94:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_95:
       b       .if_end_93
.if_wrong_92:
       mov     spill, spill
.if_end_93:
.if_end_89:
       mov     spill, spill
.while_break_1:
       mov     spill, spill
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    spill, #2
       movs    spill, #1
       movs    spill, #1
.while_continue_96:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_97:
       cmp     spill, #16
       bge     .while_break_97
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_99:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_97:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_101:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_102:
       cmp     spill, #16
       bge     .while_break_102
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_104:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_102:
       mov     spill, spill
       mov     spill, spill
.while_continue_106:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_107:
       cmp     spill, #16
       bge     .while_break_107
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_110
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_110:
       b       .if_end_109
.if_wrong_108:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_111:
.if_end_109:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_107:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_112:
       cmp     spill, #16
       bge     .while_break_112
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_114:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_112:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_116
.if_wrong_115:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_117:
       cmp     spill, #16
       bge     .while_break_117
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_119:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_117:
.if_end_116:
       mov     spill, spill
       mov     spill, spill
.while_break_106:
       mov     spill, spill
       mov     spill, spill
.if_end_105:
       mov     v2, spill
       mov     v3, spill
.while_continue_120:
       movs    spill, #0
       movs    spill, #0
       mov     spill, v2
       mov     spill, v3
.while_continue_121:
       cmp     spill, #16
       bge     .while_break_121
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_124
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_124:
       b       .if_end_123
.if_wrong_122:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_125:
.if_end_123:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_121:
       mov     v4, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, v2
       mov     spill, v3
.while_continue_126:
       cmp     spill, #16
       bge     .while_break_126
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_128:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_126:
       mov     v3, spill
       movs    spill, #0
       b       .if_end_130
.if_wrong_129:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, v3, a1
       movs    spill, #65535
.while_continue_131:
       cmp     spill, #16
       bge     .while_break_131
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_133:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_131:
.if_end_130:
       mov     v3, spill
       mov     v2, v4
.while_break_120:
       mov     spill, v2
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_136
       movs    spill, #65535
       b       .if_end_137
.if_wrong_136:
       movs    spill, #0
.if_end_137:
       b       .if_end_135
.if_wrong_134:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_141
.if_wrong_140:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_141:
       b       .if_end_139
.if_wrong_138:
       mov     spill, spill
.if_end_139:
.if_end_135:
       mov     spill, spill
.while_break_101:
       mov     spill, spill
       mov     spill, spill
.if_end_100:
       mov     v4, spill
       mov     v5, spill
       movs    v6, #0
.while_continue_142:
       movs    spill, #0
       movs    spill, #0
       mov     spill, v5
       movs    spill, #1
.while_continue_143:
       cmp     spill, #16
       bge     .while_break_143
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_145:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_143:
       mov     spill, v6
       mov     spill, v4
.while_continue_147:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_148:
       cmp     spill, #16
       bge     .while_break_148
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_151
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_151:
       b       .if_end_150
.if_wrong_149:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_152:
.if_end_150:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_148:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_153:
       cmp     spill, #16
       bge     .while_break_153
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_155:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_153:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_157
.if_wrong_156:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_158:
       cmp     spill, #16
       bge     .while_break_158
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_160:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_158:
.if_end_157:
       mov     spill, spill
       mov     spill, spill
.while_break_147:
       mov     spill, spill
       mov     v6, spill
.if_end_146:
       mov     spill, v4
       mov     spill, v4
.while_continue_161:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_162:
       cmp     spill, #16
       bge     .while_break_162
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_165
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_165:
       b       .if_end_164
.if_wrong_163:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_166:
.if_end_164:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_162:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_167:
       cmp     spill, #16
       bge     .while_break_167
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_169:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_167:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_171
.if_wrong_170:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_172:
       cmp     spill, #16
       bge     .while_break_172
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_174:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_172:
.if_end_171:
       mov     spill, spill
       mov     spill, spill
.while_break_161:
       mov     spill, spill
       mov     v4, spill
       mov     spill, v5
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_177
       movs    spill, #65535
       b       .if_end_178
.if_wrong_177:
       movs    spill, #0
.if_end_178:
       b       .if_end_176
.if_wrong_175:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_182
.if_wrong_181:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_182:
       b       .if_end_180
.if_wrong_179:
       mov     spill, spill
.if_end_180:
.if_end_176:
       mov     v5, spill
.while_break_142:
       mov     spill, v6
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_185
       movs    spill, #65535
       b       .if_end_186
.if_wrong_185:
       movs    spill, #0
.if_end_186:
       b       .if_end_184
.if_wrong_183:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_190
.if_wrong_189:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_190:
       b       .if_end_188
.if_wrong_187:
       mov     spill, spill
.if_end_188:
.if_end_184:
       mov     spill, spill
.while_break_96:
       mov     spill, spill
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       movs    spill, #2
.while_continue_191:
       cmp     spill, #16
       bge     .while_break_191
       movs    spill, #2
       mov     spill, spill
       movs    spill, #1
.while_continue_192:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_193:
       cmp     spill, #16
       bge     .while_break_193
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_195:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_193:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_197:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_198:
       cmp     spill, #16
       bge     .while_break_198
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_200:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_198:
       mov     spill, spill
       mov     spill, spill
.while_continue_202:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_203:
       cmp     spill, #16
       bge     .while_break_203
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_206
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_206:
       b       .if_end_205
.if_wrong_204:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_207:
.if_end_205:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_203:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_208:
       cmp     spill, #16
       bge     .while_break_208
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_210:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_208:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_212
.if_wrong_211:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_213:
       cmp     spill, #16
       bge     .while_break_213
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_215:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_213:
.if_end_212:
       mov     spill, spill
       mov     spill, spill
.while_break_202:
       mov     spill, spill
       mov     spill, spill
.if_end_201:
       mov     spill, spill
       mov     spill, spill
.while_continue_216:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_217:
       cmp     spill, #16
       bge     .while_break_217
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_220
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_220:
       b       .if_end_219
.if_wrong_218:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_221:
.if_end_219:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_217:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_222:
       cmp     spill, #16
       bge     .while_break_222
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_224:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_222:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_226
.if_wrong_225:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_227:
       cmp     spill, #16
       bge     .while_break_227
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_229:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_227:
.if_end_226:
       mov     spill, spill
       mov     spill, spill
.while_break_216:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_232
       movs    spill, #65535
       b       .if_end_233
.if_wrong_232:
       movs    spill, #0
.if_end_233:
       b       .if_end_231
.if_wrong_230:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_237
.if_wrong_236:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_237:
       b       .if_end_235
.if_wrong_234:
       mov     spill, spill
.if_end_235:
.if_end_231:
       mov     spill, spill
.while_break_197:
       mov     spill, spill
       mov     spill, spill
.if_end_196:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_238:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_239:
       cmp     spill, #16
       bge     .while_break_239
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_241:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_239:
       mov     spill, spill
       mov     spill, spill
.while_continue_243:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_244:
       cmp     spill, #16
       bge     .while_break_244
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_247
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_247:
       b       .if_end_246
.if_wrong_245:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_248:
.if_end_246:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_244:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_249:
       cmp     spill, #16
       bge     .while_break_249
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_251:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_249:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_253
.if_wrong_252:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_254:
       cmp     spill, #16
       bge     .while_break_254
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_256:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_254:
.if_end_253:
       mov     spill, spill
       mov     spill, spill
.while_break_243:
       mov     spill, spill
       mov     spill, spill
.if_end_242:
       mov     spill, spill
       mov     spill, spill
.while_continue_257:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_258:
       cmp     spill, #16
       bge     .while_break_258
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_261
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_261:
       b       .if_end_260
.if_wrong_259:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_262:
.if_end_260:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_258:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_263:
       cmp     spill, #16
       bge     .while_break_263
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_265:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_263:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_267
.if_wrong_266:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_268:
       cmp     spill, #16
       bge     .while_break_268
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_270:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_268:
.if_end_267:
       mov     spill, spill
       mov     spill, spill
.while_break_257:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_273
       movs    spill, #65535
       b       .if_end_274
.if_wrong_273:
       movs    spill, #0
.if_end_274:
       b       .if_end_272
.if_wrong_271:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_278
.if_wrong_277:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_278:
       b       .if_end_276
.if_wrong_275:
       mov     spill, spill
.if_end_276:
.if_end_272:
       mov     spill, spill
.while_break_238:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_281
       movs    spill, #65535
       b       .if_end_282
.if_wrong_281:
       movs    spill, #0
.if_end_282:
       b       .if_end_280
.if_wrong_279:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_286
.if_wrong_285:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_286:
       b       .if_end_284
.if_wrong_283:
       mov     spill, spill
.if_end_284:
.if_end_280:
       mov     spill, spill
.while_break_192:
       mov     spill, spill
       mov     a1, spill
       bl      t_putint
       mov     a1, a1
       movs    a1, #10
       bl      t_putch
       mov     a1, a1
       add     spill, spill, #1
.while_break_191:
       movs    spill, #0
.while_continue_287:
       cmp     spill, #16
       bge     .while_break_287
       movs    spill, #2
       mov     spill, spill
       movs    spill, #1
.while_continue_288:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_289:
       cmp     spill, #16
       bge     .while_break_289
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_291:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_289:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_293:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_294:
       cmp     spill, #16
       bge     .while_break_294
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_296:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_294:
       mov     spill, spill
       mov     spill, spill
.while_continue_298:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_299:
       cmp     spill, #16
       bge     .while_break_299
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_302
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_302:
       b       .if_end_301
.if_wrong_300:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_303:
.if_end_301:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_299:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_304:
       cmp     spill, #16
       bge     .while_break_304
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_306:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_304:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_308
.if_wrong_307:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_309:
       cmp     spill, #16
       bge     .while_break_309
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_311:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_309:
.if_end_308:
       mov     spill, spill
       mov     spill, spill
.while_break_298:
       mov     spill, spill
       mov     spill, spill
.if_end_297:
       mov     spill, spill
       mov     spill, spill
.while_continue_312:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_313:
       cmp     spill, #16
       bge     .while_break_313
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_316
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_316:
       b       .if_end_315
.if_wrong_314:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_317:
.if_end_315:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_313:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_318:
       cmp     spill, #16
       bge     .while_break_318
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_320:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_318:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_322
.if_wrong_321:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_323:
       cmp     spill, #16
       bge     .while_break_323
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_325:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_323:
.if_end_322:
       mov     spill, spill
       mov     spill, spill
.while_break_312:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_328
       movs    spill, #65535
       b       .if_end_329
.if_wrong_328:
       movs    spill, #0
.if_end_329:
       b       .if_end_327
.if_wrong_326:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_333
.if_wrong_332:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_333:
       b       .if_end_331
.if_wrong_330:
       mov     spill, spill
.if_end_331:
.if_end_327:
       mov     spill, spill
.while_break_293:
       mov     spill, spill
       mov     spill, spill
.if_end_292:
       mov     spill, spill
       mov     spill, spill
       movs    spill, #0
.while_continue_334:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       movs    spill, #1
.while_continue_335:
       cmp     spill, #16
       bge     .while_break_335
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_337:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_335:
       mov     spill, spill
       mov     spill, spill
.while_continue_339:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_340:
       cmp     spill, #16
       bge     .while_break_340
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_343
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_343:
       b       .if_end_342
.if_wrong_341:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_344:
.if_end_342:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_340:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_345:
       cmp     spill, #16
       bge     .while_break_345
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_347:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_345:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_349
.if_wrong_348:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_350:
       cmp     spill, #16
       bge     .while_break_350
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_352:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_350:
.if_end_349:
       mov     spill, spill
       mov     spill, spill
.while_break_339:
       mov     spill, spill
       mov     spill, spill
.if_end_338:
       mov     spill, spill
       mov     spill, spill
.while_continue_353:
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_354:
       cmp     spill, #16
       bge     .while_break_354
       mod     a1, spill, #2
       mod     a1, spill, #2
       cmp     a1, #0
       bne     .if_end_357
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_357:
       b       .if_end_356
.if_wrong_355:
       mod     a1, spill, #2
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_358:
.if_end_356:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_354:
       mov     spill, spill
       movs    spill, #0
       movs    spill, #0
       mov     spill, spill
       mov     spill, spill
.while_continue_359:
       cmp     spill, #16
       bge     .while_break_359
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_361:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_359:
       mov     spill, spill
       movs    spill, #0
       b       .if_end_363
.if_wrong_362:
       movs    spill, #0
       movs    spill, #0
       movs    a1, #1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     spill, spill, a1
       movs    spill, #65535
.while_continue_364:
       cmp     spill, #16
       bge     .while_break_364
       movs    a1, #0
       mod     a1, spill, #2
       mod     a1, spill, #2
       movs    a1, #1
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       mul     a1, no_name, a1
       add     spill, spill, a1
.if_end_366:
       div     spill, spill, #2
       div     spill, spill, #2
       add     spill, spill, #1
.while_break_364:
.if_end_363:
       mov     spill, spill
       mov     spill, spill
.while_break_353:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_369
       movs    spill, #65535
       b       .if_end_370
.if_wrong_369:
       movs    spill, #0
.if_end_370:
       b       .if_end_368
.if_wrong_367:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_374
.if_wrong_373:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_374:
       b       .if_end_372
.if_wrong_371:
       mov     spill, spill
.if_end_372:
.if_end_368:
       mov     spill, spill
.while_break_334:
       mov     spill, spill
       mov     spill, spill
       mov     spill, spill
       movs    spill, #1
       cmp     spill, #0
       bge     .if_wrong_377
       movs    spill, #65535
       b       .if_end_378
.if_wrong_377:
       movs    spill, #0
.if_end_378:
       b       .if_end_376
.if_wrong_375:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
       add     a1, spill, #65536
       sub     a1, no_name, spill
       add     a1, a1, #1
       mov     a1, a1
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a1, v1, a1
       ldr     a2, [a1]
       sub     spill, a1, a2
       b       .if_end_382
.if_wrong_381:
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
       div     spill, spill, a1
.if_end_382:
       b       .if_end_380
.if_wrong_379:
       mov     spill, spill
.if_end_380:
.if_end_376:
       mov     spill, spill
.while_break_288:
       mov     spill, spill
       mov     a1, spill
       mul     a1, a1, #4
       movw    v1, #:lower16:SHIFT_TABLE
       movt    v1, #:upper16:SHIFT_TABLE
       ldr     v1, [v1]
       add     a2, v1, a1
       ldr     a1, [a2]
.if_end_383:
       add     spill, spill, #1
.while_break_287:
       movs    a1, #0
       pop     {r7, pc}
main:
       push    {r7, lr}
       add     r7, sp, #0
       bl      long_func
       mov     a1, a1
       pop     {r7, pc}
SHIFT_TABLE:
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
       .word    1
:
       .word    2
:
       .word    4
:
       .word    8
:
       .word    16
:
       .word    32
:
       .word    64
:
       .word    128
:
       .word    256
:
       .word    512
:
       .word    1024
:
       .word    2048
:
       .word    4096
:
       .word    8192
:
       .word    16384
:
       .word    32768
