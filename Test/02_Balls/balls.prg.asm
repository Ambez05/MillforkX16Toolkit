* = $801
_basic_loader.array:
    !byte $B, 8, $A, 0, $9E, $32, $30, $36, $31, 0, 0, 0
 
* = $80d
main:
    JSR X_ModeGet
    CMP #$50
    BEQ .fi__00096
    JSR $FF5F
.fi__00096:
main$GetBallCount:
    LDA #0
    STA V_SetArea$x1
    LDA #0
    STA V_SetArea$y1
    LDA #$4F
    STA V_SetArea$x2
    LDA #$3B
    STA V_SetArea$y2
    LDA #$20
    STA V_SetArea$data
    LDA #0
    STA V_SetArea$color
    JSR V_SetArea
    LDA #$1E
    STA V_PutString$x1
    LDA #$1E
    STA V_PutString$y1
    LDA #$3C
    STA V_PutString$x2
    LDA #$1E
    STA V_PutString$y2
    LDA #$7B
    STA V_PutString$color
    LDA #0
    STA V_PutString$newLineChar
    LDA #lo(main$b.array)
    STA V_PutString$strWord
    LDA #hi(main$b.array)
    STA V_PutString$strWord + 1
    JSR V_PutString
    LDA #$3C
    STA G_GetStringLine$x
    LDA #$1E
    STA G_GetStringLine$y
    LDA #$A
    STA G_GetStringLine$ln
    LDA #lo(main$allowChars.array)
    STA G_GetStringLine$allow
    LDA #hi(main$allowChars.array)
    STA G_GetStringLine$allow + 1
    LDA #lo(main$ballCountString.array)
    STA G_GetStringLine$strDataWord
    LDA #hi(main$ballCountString.array)
    STA G_GetStringLine$strDataWord + 1
    JSR G_GetStringLine
    LDA #lo(main$ballCountString.array)
    STA strz2word$str
    LDA #hi(main$ballCountString.array)
    STA strz2word$str + 1
    JSR strz2word
    STA main$ballCount
    STX main$ballCount + 1
    LDA #0
    CMP main$ballCount + 1
    BCC .cp__00098
    BNE .fi__00097
    LDA #$FF
    CMP main$ballCount
    BCS .fi__00097
.cp__00098:
    JMP main$GetBallCount
.fi__00097:
    LDA #0
    STA V_SetArea$x1
    LDA #0
    STA V_SetArea$y1
    LDA #$4F
    STA V_SetArea$x2
    LDA #$3B
    STA V_SetArea$y2
    LDA #$20
    STA V_SetArea$data
    LDA #0
    STA V_SetArea$color
    JSR V_SetArea
    LDA #0
    STA main$lp
.wh__00099:
    LDA #0
    STA U_RandBetween$LoNum
    LDA #$4F
    STA U_RandBetween$HiNum
    JSR U_RandBetween
    LDY main$lp
    STA main$BX.array, Y
    LDA #0
    STA U_RandBetween$LoNum
    LDA #$3B
    STA U_RandBetween$HiNum
    JSR U_RandBetween
    LDY main$lp
    STA main$BY.array, Y
    LDA #0
    STA U_RandBetween$LoNum
    LDA #$FF
    STA U_RandBetween$HiNum
    JSR U_RandBetween
    LDY main$lp
    STA main$BC.array, Y
    LDA #0
    STA U_RandBetween$LoNum
    LDA #1
    STA U_RandBetween$HiNum
    JSR U_RandBetween
    LDY main$lp
    STA main$DX.array, Y
    LDA #0
    STA U_RandBetween$LoNum
    LDA #1
    STA U_RandBetween$HiNum
    JSR U_RandBetween
    LDY main$lp
    STA main$DY.array, Y
.fp__00101:
    LDA main$lp
    EOR main$ballCount
    ORA main$ballCount + 1
    BNE .el__00103
    JMP .ew__00102
    JMP .fi__00104
.el__00103:
    INC main$lp
.fi__00104:
    JMP .wh__00099
.ew__00102:
.wh__00105:
    LDA #0
    STA main$lp
.wh__00109:
    LDY main$lp
    LDA main$BY.array, Y
    STA __reg
    LDA #0
    STA __reg + 1
    LDX #8
    BEQ .ss__00116
.sr__00115:
    ASL __reg
    ROL __reg + 1
    DEX
    BNE .sr__00115
.ss__00116:
    LDA __reg
    LDX __reg + 1
    STA __reg
    STX __reg + 1
    LDA __reg + 1
    PHA
    LDA __reg
    PHA
    LDY main$lp
    LDA main$BX.array, Y
    ASL
    STA __reg
    LDA #0
    STA __reg + 1
    CLC
    PLA
    ADC __reg
    STA __reg
    PLA
    ADC __reg + 1
    STA __reg + 1
    CLC
    LDA __reg
    ADC #1
    STA __reg
    LDA __reg + 1
    ADC #0
    STA __reg + 1
    LDA __reg
    LDX __reg + 1
    STA vera_poke$address
    STX vera_poke$address + 1
    LDA #0
    STA vera_poke$address + 2
    LDA #0
    STA vera_poke$value
    JSR vera_poke
    LDY main$lp
    LDA main$DX.array, Y
    BNE .el__00122
    LDY main$lp
    LDA main$BX.array, Y
    BNE .el__00117
    LDA #1
    LDY main$lp
    STA main$DX.array, Y
    JMP .fi__00118
.el__00117:
    LDY main$lp
    LDA main$BX.array, Y
    SEC
    SBC #1
    LDY main$lp
    STA main$BX.array, Y
.fi__00118:
    JMP .fi__00123
.el__00122:
    LDY main$lp
    LDA main$DX.array, Y
    CMP #1
    BNE .fi__00121
    LDY main$lp
    LDA main$BX.array, Y
    CMP #$4F
    BNE .el__00119
    LDA #$4E
    LDY main$lp
    STA main$BX.array, Y
    LDA #0
    LDY main$lp
    STA main$DX.array, Y
    JMP .fi__00120
.el__00119:
    LDY main$lp
    LDA main$BX.array, Y
    CLC
    ADC #1
    LDY main$lp
    STA main$BX.array, Y
.fi__00120:
.fi__00121:
.fi__00123:
    LDY main$lp
    LDA main$DY.array, Y
    BNE .el__00129
    LDY main$lp
    LDA main$BY.array, Y
    BNE .el__00124
    LDA #1
    LDY main$lp
    STA main$DY.array, Y
    JMP .fi__00125
.el__00124:
    LDY main$lp
    LDA main$BY.array, Y
    SEC
    SBC #1
    LDY main$lp
    STA main$BY.array, Y
.fi__00125:
    JMP .fi__00130
.el__00129:
    LDY main$lp
    LDA main$DY.array, Y
    CMP #1
    BNE .fi__00128
    LDY main$lp
    LDA main$BY.array, Y
    CMP #$3B
    BNE .el__00126
    LDA #$3A
    LDY main$lp
    STA main$BY.array, Y
    LDA #0
    LDY main$lp
    STA main$DY.array, Y
    JMP .fi__00127
.el__00126:
    LDY main$lp
    LDA main$BY.array, Y
    CLC
    ADC #1
    LDY main$lp
    STA main$BY.array, Y
.fi__00127:
.fi__00128:
.fi__00130:
    LDY main$lp
    LDA main$BY.array, Y
    STA __reg
    LDA #0
    STA __reg + 1
    LDX #8
    BEQ .ss__00134
.sr__00133:
    ASL __reg
    ROL __reg + 1
    DEX
    BNE .sr__00133
.ss__00134:
    LDA __reg
    LDX __reg + 1
    STA __reg
    STX __reg + 1
    LDA __reg + 1
    PHA
    LDA __reg
    PHA
    LDY main$lp
    LDA main$BX.array, Y
    ASL
    STA __reg
    LDA #0
    STA __reg + 1
    CLC
    PLA
    ADC __reg
    STA __reg
    PLA
    ADC __reg + 1
    STA __reg + 1
    CLC
    LDA __reg
    ADC #1
    STA __reg
    LDA __reg + 1
    ADC #0
    STA __reg + 1
    LDA __reg
    LDX __reg + 1
    STA vera_poke$address
    STX vera_poke$address + 1
    LDA #0
    STA vera_poke$address + 2
    LDY main$lp
    LDA main$BC.array, Y
    STA vera_poke$value
    JSR vera_poke
.fp__00111:
    LDA main$lp
    EOR main$ballCount
    ORA main$ballCount + 1
    BNE .el__00135
    JMP .ew__00112
    JMP .fi__00136
.el__00135:
    INC main$lp
.fi__00136:
    JMP .wh__00109
.ew__00112:
    LDA #$A0
    STA X_PauseCycle$CycleCount
    LDA #$F
    STA X_PauseCycle$CycleCount + 1
    JSR X_PauseCycle
.fp__00107:
    JMP .wh__00105
.ew__00108:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $aa5
G_GetStringLine:
    LDA G_GetStringLine$strDataWord
    STA $FE
    LDA G_GetStringLine$strDataWord + 1
    STA $FF
    LDA G_GetStringLine$x
    STA V_SetArea$x1
    LDA G_GetStringLine$y
    STA V_SetArea$y1
    LDA G_GetStringLine$x
    CLC
    ADC G_GetStringLine$ln
    SEC
    SBC #1
    STA V_SetArea$x2
    LDA G_GetStringLine$y
    STA V_SetArea$y2
    LDA #$20
    STA V_SetArea$data
    LDA #$7B
    STA V_SetArea$color
    JSR V_SetArea
    LDA G_GetStringLine$allow
    STA strzlen$str
    LDA G_GetStringLine$allow + 1
    STA strzlen$str + 1
    JSR strzlen
    STA G_GetStringLine$allowLength
    JSR X_KeyboardGetState
    STA G_GetStringLine$key
    LDA #0
    STA G_GetStringLine$spot
.wh__00062:
    JSR X_KeyboardGetState
    STA G_GetStringLine$key
    LDA G_GetStringLine$key
    BNE .th__00082
    JMP .fi__00083
.th__00082:
    LDA G_GetStringLine$key
    CMP #$14
    BNE .el__00080
    LDA G_GetStringLine$spot
    CMP #0
    BCC .fi__00066
    BEQ .fi__00066
    LDA #0
    LDY G_GetStringLine$spot
    STA ($FE), Y
    LDA G_GetStringLine$spot
    SEC
    SBC #1
    STA G_GetStringLine$spot
    LDA #0
    LDY G_GetStringLine$spot
    STA ($FE), Y
    LDA #0
    STA G_GetStringLine$key
.fi__00066:
    JMP .fi__00081
.el__00080:
    LDA G_GetStringLine$key
    CMP #3
    BNE .el__00078
    LDA #0
    LDY #0
    STA ($FE), Y
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
    JMP .fi__00079
.el__00078:
    LDA G_GetStringLine$key
    CMP #$D
    BNE .el__00076
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
    JMP .fi__00077
.el__00076:
    LDA G_GetStringLine$spot
    CMP G_GetStringLine$ln
    BCS .fi__00075
    LDA #0
    STA G_GetStringLine$allowFound
    LDA G_GetStringLine$allowLength
    CMP #0
    BCC .el__00072
    BEQ .el__00072
    LDA #0
    STA G_GetStringLine$lp
    JMP .he__00068
.wh__00067:
    LDY G_GetStringLine$lp
    LDA (G_GetStringLine$allow), Y
    CMP G_GetStringLine$key
    BNE .fi__00071
    LDA #1
    STA G_GetStringLine$allowFound
    JMP .ew__00070
.fi__00071:
.fp__00069:
    INC G_GetStringLine$lp
.he__00068:
    LDA G_GetStringLine$lp
    CMP G_GetStringLine$allowLength
    BCC .wh__00067
.ew__00070:
    JMP .fi__00073
.el__00072:
    LDA #1
    STA G_GetStringLine$allowFound
.fi__00073:
    LDA G_GetStringLine$allowFound
    CMP #1
    BNE .fi__00074
    LDA G_GetStringLine$key
    LDY G_GetStringLine$spot
    STA ($FE), Y
    LDA G_GetStringLine$spot
    CLC
    ADC #1
    STA G_GetStringLine$spot
    LDA #0
    LDY G_GetStringLine$spot
    STA ($FE), Y
.fi__00074:
.fi__00075:
.fi__00077:
.fi__00079:
.fi__00081:
    LDA G_GetStringLine$x
    STA V_SetArea$x1
    LDA G_GetStringLine$y
    STA V_SetArea$y1
    LDA G_GetStringLine$x
    CLC
    ADC G_GetStringLine$ln
    SEC
    SBC #1
    STA V_SetArea$x2
    LDA G_GetStringLine$y
    STA V_SetArea$y2
    LDA #$20
    STA V_SetArea$data
    LDA #$7B
    STA V_SetArea$color
    JSR V_SetArea
    LDA G_GetStringLine$x
    STA V_PutString$x1
    LDA G_GetStringLine$y
    STA V_PutString$y1
    LDA G_GetStringLine$x
    CLC
    ADC G_GetStringLine$ln
    STA V_PutString$x2
    LDA G_GetStringLine$y
    STA V_PutString$y2
    LDA #$7B
    STA V_PutString$color
    LDA #0
    STA V_PutString$newLineChar
    LDA $FE
    STA V_PutString$strWord
    LDA $FF
    STA V_PutString$strWord + 1
    JSR V_PutString
.fi__00083:
.fp__00064:
    JMP .wh__00062
.ew__00065:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $bcd
X_KeyboardGetState:
    JSR $FFE4
    STA X_KeyboardGetState$result
    LDA X_KeyboardGetState$result
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $bd6
__mod_u8u8u8u8:
    LDA #0
    LDX #7
    CLC
__divmod_u8u8u8u8_start:
    ROL __reg
    ROL
    CMP __reg + 1
    BCC __divmod_u8u8u8u8_skip
    SBC __reg + 1
__divmod_u8u8u8u8_skip:
    DEX
    BPL __divmod_u8u8u8u8_start
    ROL __reg
    RTS
 
* = $bea
X_PauseCycle:
    LDA #1
    STA X_PauseCycle$pause
    LDA #0
    STA X_PauseCycle$pause + 1
    JMP .he__00034
.wh__00033:
    LDA #1
    CLC
    ADC X_PauseCycle$pause
    STA X_PauseCycle$pause
    LDA #0
    ADC X_PauseCycle$pause + 1
    STA X_PauseCycle$pause + 1
.fp__00035:
.he__00034:
    LDA X_PauseCycle$pause + 1
    CMP X_PauseCycle$CycleCount + 1
    BCC .wh__00033
    BNE .cp__00037
    LDA X_PauseCycle$pause
    CMP X_PauseCycle$CycleCount
    BCC .wh__00033
.cp__00037:
.ew__00036:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $c11
V_PutString:
    LDA V_PutString$strWord
    STA $FE
    LDA V_PutString$strWord + 1
    STA $FF
    LDA V_PutString$x1
    STA V_PutString$lx
    LDA V_PutString$y1
    STA V_PutString$ly
    LDA #0
    STA V_PutString$s_spot
    LDA #0
    STA V_PutString$s_spot + 1
    LDA #$10
    STA $9F22
    LDA V_PutString$lx
    CLC
    ADC V_PutString$lx
    STA $9F20
    LDA V_PutString$ly
    STA $9F21
.wh__00013:
    LDA V_PutString$lx
    CMP V_PutString$x2
    BCC .fi__00021
    BEQ .fi__00021
    LDA V_PutString$x1
    STA V_PutString$lx
    LDA V_PutString$ly
    CLC
    ADC #1
    STA V_PutString$ly
    LDA V_PutString$lx
    CLC
    ADC V_PutString$lx
    STA $9F20
    LDA V_PutString$ly
    STA $9F21
.fi__00021:
    LDA V_PutString$ly
    CMP V_PutString$y2
    BCC .fi__00022
    BEQ .fi__00022
    JMP .ew__00016
.fi__00022:
V_PutString$TestStringLocation:
    LDY V_PutString$s_spot
    LDA V_PutString$s_spot + 1
    CLC
    ADC $FF
    STA __reg + 1
    LDA $FE
    STA __reg
    LDA (__reg), Y
    BNE .fi__00023
    JMP .ew__00016
.fi__00023:
    LDY V_PutString$s_spot
    LDA V_PutString$s_spot + 1
    CLC
    ADC $FF
    STA __reg + 1
    LDA $FE
    STA __reg
    LDA (__reg), Y
    CMP V_PutString$newLineChar
    BNE .fi__00028
    LDA V_PutString$x1
    STA V_PutString$lx
    LDA V_PutString$ly
    CLC
    ADC #1
    STA V_PutString$ly
    LDA V_PutString$lx
    CLC
    ADC V_PutString$lx
    STA $9F20
    LDA V_PutString$ly
    STA $9F21
    LDA #1
    CLC
    ADC V_PutString$s_spot
    STA V_PutString$s_spot
    LDA #0
    ADC V_PutString$s_spot + 1
    STA V_PutString$s_spot + 1
    JMP V_PutString$TestStringLocation
.fi__00028:
    LDY V_PutString$s_spot
    LDA V_PutString$s_spot + 1
    CLC
    ADC $FF
    STA __reg + 1
    LDA $FE
    STA __reg
    LDA (__reg), Y
    STA $9F23
    LDA V_PutString$color
    STA $9F23
    LDA V_PutString$lx
    CLC
    ADC #1
    STA V_PutString$lx
    LDA #1
    CLC
    ADC V_PutString$s_spot
    STA V_PutString$s_spot
    LDA #0
    ADC V_PutString$s_spot + 1
    STA V_PutString$s_spot + 1
.fp__00015:
    JMP .wh__00013
.ew__00016:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $ce4
strz2word:
    LDA #0
    STA strz2word$result
    LDA #0
    STA strz2word$result + 1
    LDA #0
    STA strz2word$i
    LDA #0
    STA errno
.wh__00084:
    LDY strz2word$i
    LDA (strz2word$str), Y
    STA strz2word$char
    LDA strz2word$char
    BNE .fi__00089
    LDA strz2word$i
    BNE .fi__00088
    LDA #2
    STA errno
.fi__00088:
    LDA strz2word$result
    LDX strz2word$result + 1
    ; DISCARD_YF
    RTS
.fi__00089:
    LDA #$30
    CMP strz2word$char
    BEQ .co__00094
    BCS .el__00092
.co__00094:
    LDA strz2word$char
    CMP #$39
    BEQ .co__00095
    BCS .el__00092
.co__00095:
    LDA strz2word$result
    LDX strz2word$result + 1
    STA __reg
    STX __reg + 1
    LDA #$A
    STA __reg + 2
    JSR __mul_u16u8u16
    STA strz2word$next
    STX strz2word$next + 1
    LDA strz2word$char
    SEC
    SBC #$30
    CLC
    ADC strz2word$next
    STA strz2word$next
    LDA #0
    ADC strz2word$next + 1
    STA strz2word$next + 1
    LDA strz2word$next + 1
    CMP strz2word$result + 1
    BCC .cp__00091
    BNE .fi__00090
    LDA strz2word$next
    CMP strz2word$result
    BCS .fi__00090
.cp__00091:
    LDA #5
    STA errno
.fi__00090:
    LDA strz2word$next
    STA strz2word$result
    LDA strz2word$next + 1
    STA strz2word$result + 1
    JMP .fi__00093
.el__00092:
    LDA #2
    STA errno
    LDA strz2word$result
    LDX strz2word$result + 1
    ; DISCARD_YF
    RTS
.fi__00093:
    INC strz2word$i
.fp__00086:
    JMP .wh__00084
.ew__00087:
    LDA #0
    LDX #0
    ; DISCARD_YF
    RTS
 
* = $d6e
__divmod_u16u16u16u16:
    LDA __reg + 3
    PHA
    LDA __reg + 2
    PHA
    STZ __reg + 2
    STZ __reg + 3
    LDA #$10
    PHA
    TSX
__divmod_u16u16u16u16_loop:
    ASL __reg
    ROL __reg + 1
    ROL __reg + 2
    ROL __reg + 3
    LDA __reg + 2
    SEC
    SBC $102, X
    TAY
    LDA __reg + 3
    SBC $103, X
    BCC __divmod_u16u16u16u16_skip
    STA __reg + 3
    STY __reg + 2
    INC __reg
__divmod_u16u16u16u16_skip:
    DEC $101, X
    BNE __divmod_u16u16u16u16_loop
    INX
    INX
    INX
    TXS
    RTS
 
* = $da2
rand:
    LDX #8
    LDA rand_seed
__rand_loop:
    ASL
    ROL rand_seed + 1
    BCC __no_eor
    EOR #$2D
__no_eor:
    DEX
    BNE __rand_loop
    STA rand_seed
    RTS
 
* = $db3
__mul_u16u8u16:
    LDA #0
    TAX
    JMP __mul_u16u8u16_start
__mul_u16u8u16_add:
    CLC
    ADC __reg
    TAY
    TXA
    ADC __reg + 1
    TAX
    TYA
__mul_u16u8u16_loop:
    ASL __reg
    ROL __reg + 1
__mul_u16u8u16_start:
    LSR __reg + 2
    BCS __mul_u16u8u16_add
    BNE __mul_u16u8u16_loop
    RTS
 
* = $dcd
X_ModeGet:
    LDA $D9
    STA X_ModeGet$result
    LDA X_ModeGet$result
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $dd5
U_RandBetween:
    JSR rand
    STA U_RandBetween$randNum
    LDA U_RandBetween$HiNum
    CMP U_RandBetween$LoNum
    BNE .fi__00001
    LDA U_RandBetween$HiNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
.fi__00001:
    LDA U_RandBetween$HiNum
    CMP U_RandBetween$LoNum
    BCS .fi__00002
    LDA U_RandBetween$HiNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
.fi__00002:
    LDA U_RandBetween$randNum
    CMP U_RandBetween$HiNum
    BCC .el__00005
    BEQ .el__00005
    LDA U_RandBetween$randNum
    STA __reg
    LDA U_RandBetween$HiNum
    SEC
    SBC U_RandBetween$LoNum
    CLC
    ADC #1
    STA __reg + 1
    JSR __mod_u8u8u8u8
    STA U_RandBetween$randNum
    LDA U_RandBetween$randNum
    CLC
    ADC U_RandBetween$LoNum
    STA U_RandBetween$randNum
    LDA U_RandBetween$randNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
    JMP .fi__00006
.el__00005:
    LDA U_RandBetween$randNum
    CMP U_RandBetween$LoNum
    BCS .el__00003
    LDA U_RandBetween$randNum
    STA __reg
    LDA U_RandBetween$HiNum
    SEC
    SBC U_RandBetween$LoNum
    CLC
    ADC #1
    STA __reg + 1
    JSR __mod_u8u8u8u8
    STA U_RandBetween$randNum
    LDA U_RandBetween$randNum
    CLC
    ADC U_RandBetween$LoNum
    STA U_RandBetween$randNum
    LDA U_RandBetween$randNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
    JMP .fi__00004
.el__00003:
    LDA U_RandBetween$randNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
.fi__00004:
.fi__00006:
    LDA U_RandBetween$HiNum
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $e40
V_SetArea:
    LDA V_SetArea$x1
    STA V_SetArea$lx
    LDA V_SetArea$y1
    STA V_SetArea$ly
    LDA #$10
    STA $9F22
    LDA V_SetArea$lx
    CLC
    ADC V_SetArea$lx
    STA $9F20
    LDA V_SetArea$ly
    STA $9F21
.wh__00048:
    LDA V_SetArea$lx
    CMP V_SetArea$x2
    BCC .fi__00056
    BEQ .fi__00056
    LDA V_SetArea$x1
    STA V_SetArea$lx
    LDA V_SetArea$ly
    CLC
    ADC #1
    STA V_SetArea$ly
    LDA V_SetArea$lx
    CLC
    ADC V_SetArea$lx
    STA $9F20
    LDA V_SetArea$ly
    STA $9F21
.fi__00056:
    LDA V_SetArea$ly
    CMP V_SetArea$y2
    BCC .fi__00057
    BEQ .fi__00057
    JMP .ew__00051
.fi__00057:
    LDA V_SetArea$data
    STA $9F23
    LDA V_SetArea$color
    STA $9F23
    LDA V_SetArea$lx
    CLC
    ADC #1
    STA V_SetArea$lx
.fp__00050:
    JMP .wh__00048
.ew__00051:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $e9a
strzlen:
    LDA #0
    STA strzlen$index
    JMP .he__00039
.wh__00038:
    INC strzlen$index
.fp__00040:
.he__00039:
    LDY strzlen$index
    LDA (strzlen$str), Y
    BNE .wh__00038
.ew__00041:
    LDA strzlen$index
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
 
* = $eac
vera_poke:
    LDA vera_poke$address
    STA $9F20
    LDA vera_poke$address + 1
    STA $9F21
    LDA vera_poke$address + 2
    STA $9F22
    LDA #0
    STA $9F25
    LDA vera_poke$value
    STA $9F23
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
* = $ec6
main$allowChars.array:
    !byte $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, 0
* = $ed1
main$b.array:
    !byte $E, $15, $D, 2, 5, $12, $20, $F, 6, $20, 2, 1, $C, $C, $13, $20
    !byte $28, $31, $2D, $32, $35, $35, $29, $3F, 0
.co__00094                     = $0D13
.co__00095                     = $0D1B
.cp__00037                     = $0C10
.cp__00091                     = $0D4C
.cp__00098                     = $0891
.el__00003                     = $0E3A
.el__00005                     = $0E14
.el__00072                     = $0B65
.el__00076                     = $0B32
.el__00078                     = $0B28
.el__00080                     = $0B18
.el__00092                     = $0D5B
.el__00103                     = $0911
.el__00117                     = $098D
.el__00119                     = $09C0
.el__00122                     = $099D
.el__00124                     = $09E5
.el__00126                     = $0A18
.el__00129                     = $09F5
.el__00135                     = $0A91
.ew__00016                     = $0CE3
.ew__00036                     = $0C10
.ew__00041                     = $0EA9
.ew__00051                     = $0E99
.ew__00065                     = $0BCC
.ew__00070                     = $0B62
.ew__00087                     = $0D69
.ew__00102                     = $0916
.ew__00108                     = $0AA4
.ew__00112                     = $0A96
.fi__00001                     = $0DE3
.fi__00002                     = $0DEC
.fi__00004                     = $0E3D
.fi__00006                     = $0E3D
.fi__00021                     = $0C5B
.fi__00022                     = $0C66
.fi__00023                     = $0C7A
.fi__00028                     = $0CB5
.fi__00056                     = $0E7A
.fi__00057                     = $0E85
.fi__00066                     = $0B15
.fi__00071                     = $0B5A
.fi__00073                     = $0B69
.fi__00074                     = $0B82
.fi__00075                     = $0B82
.fi__00077                     = $0B82
.fi__00079                     = $0B82
.fi__00081                     = $0B82
.fi__00083                     = $0BC9
.fi__00088                     = $0D06
.fi__00089                     = $0D0B
.fi__00090                     = $0D50
.fi__00093                     = $0D64
.fi__00096                     = $0817
.fi__00097                     = $0894
.fi__00104                     = $0913
.fi__00118                     = $099A
.fi__00120                     = $09CD
.fi__00121                     = $09CD
.fi__00123                     = $09CD
.fi__00125                     = $09F2
.fi__00127                     = $0A25
.fi__00128                     = $0A25
.fi__00130                     = $0A25
.fi__00136                     = $0A93
.fp__00015                     = $0CE0
.fp__00035                     = $0C02
.fp__00040                     = $0EA3
.fp__00050                     = $0E96
.fp__00064                     = $0BC9
.fp__00069                     = $0B5A
.fp__00086                     = $0D66
.fp__00101                     = $0903
.fp__00107                     = $0AA1
.fp__00111                     = $0A83
.he__00034                     = $0C02
.he__00039                     = $0EA3
.he__00068                     = $0B5C
.sr__00115                     = $0929
.sr__00133                     = $0A34
.ss__00116                     = $0930
.ss__00134                     = $0A3B
.th__00082                     = $0AF0
.wh__00013                     = $0C3B
.wh__00033                     = $0BF5
.wh__00038                     = $0EA1
.wh__00048                     = $0E5A
.wh__00062                     = $0AE4
.wh__00067                     = $0B4B
.wh__00084                     = $0CF4
.wh__00099                     = $08B3
.wh__00105                     = $0916
.wh__00109                     = $091A
G_GetStringLine                = $0AA5
G_GetStringLine$allow          = $0000
G_GetStringLine$allowFound     = $0011
G_GetStringLine$allowLength    = $000D
G_GetStringLine$key            = $0009
G_GetStringLine$ln             = $000F
G_GetStringLine$lp             = $0010
G_GetStringLine$spot           = $0008
G_GetStringLine$strDataWord    = $000B
G_GetStringLine$x              = $000E
G_GetStringLine$y              = $000A
U_RandBetween                  = $0DD5
U_RandBetween$HiNum            = $003B
U_RandBetween$LoNum            = $003C
U_RandBetween$randNum          = $003A
V_PutString                    = $0C11
V_PutString$TestStringLocation = $0C66
V_PutString$color              = $0017
V_PutString$lx                 = $0016
V_PutString$ly                 = $001B
V_PutString$newLineChar        = $0013
V_PutString$s_spot             = $0018
V_PutString$strWord            = $0006
V_PutString$x1                 = $001A
V_PutString$x2                 = $0014
V_PutString$y1                 = $0015
V_PutString$y2                 = $001C
V_SetArea                      = $0E40
V_SetArea$color                = $0041
V_SetArea$data                 = $0042
V_SetArea$lx                   = $0040
V_SetArea$ly                   = $0044
V_SetArea$x1                   = $0043
V_SetArea$x2                   = $003E
V_SetArea$y1                   = $003F
V_SetArea$y2                   = $0045
X_KeyboardGetState             = $0BCD
X_KeyboardGetState$result      = $0012
X_ModeGet                      = $0DCD
X_ModeGet$result               = $0038
X_PauseCycle                   = $0BEA
X_PauseCycle$CycleCount        = $0006
X_PauseCycle$pause             = $0000
__divmod_u16u16u16u16          = $0D6E
__divmod_u16u16u16u16_loop     = $0D7C
__divmod_u16u16u16u16_skip     = $0D98
__divmod_u8u8u8u8_skip         = $0BE4
__divmod_u8u8u8u8_start        = $0BDB
__heap_start                   = $13E5
__mod_u8u8u8u8                 = $0BD6
__mul_u16u8u16                 = $0DB3
__mul_u16u8u16_add             = $0DB9
__mul_u16u8u16_loop            = $0DC2
__mul_u16u8u16_start           = $0DC6
__no_eor                       = $0DAD
__rand_loop                    = $0DA6
__reg                          = $0002
__rwdata_end                   = $0000
__rwdata_start                 = $0000
__zeropage_end                 = $0100
__zeropage_first               = $0000
__zeropage_last                = $00FF
__zeropage_usage               = $0100
errno                          = $0039
main                           = $080D
main$BC.array                  = $11E7
main$BX.array                  = $10E8
main$BY.array                  = $0EEA
main$DX.array                  = $0FE9
main$DY.array                  = $12E6
main$GetBallCount              = $0817
main$allowChars.array          = $0EC6
main$b.array                   = $0ED1
main$ballCount                 = $0036
main$ballCountString.array     = $0028
main$lp                        = $0035
main$pause                     = $0033
rand                           = $0DA2
rand_seed                      = $0021
segment.default.bank           = $0000
segment.default.end            = $9EFF
segment.default.heapstart      = $13E5
segment.default.length         = $9016
segment.default.start          = $0EEA
segment.himem_00.bank          = $0000
segment.himem_00.end           = $BFFF
segment.himem_00.heapstart     = $A000
segment.himem_00.length        = $2000
segment.himem_00.start         = $A000
segment.himem_ff.bank          = $00FF
segment.himem_ff.end           = $BFFF
segment.himem_ff.heapstart     = $A000
segment.himem_ff.length        = $2000
segment.himem_ff.start         = $A000
strz2word                      = $0CE4
strz2word$char                 = $0026
strz2word$i                    = $0025
strz2word$next                 = $0006
strz2word$result               = $0023
strz2word$str                  = $0000
strzlen                        = $0E9A
strzlen$index                  = $003D
strzlen$str                    = $0006
vera_poke                      = $0EAC
vera_poke$address              = $0046
vera_poke$value                = $0049
    ; $0000 = G_GetStringLine$allow
    ; $0000 = X_PauseCycle$pause
    ; $0000 = __rwdata_end
    ; $0000 = __rwdata_start
    ; $0000 = __zeropage_first
    ; $0000 = segment.default.bank
    ; $0000 = segment.himem_00.bank
    ; $0000 = strz2word$str
    ; $0002 = __reg
    ; $0006 = V_PutString$strWord
    ; $0006 = X_PauseCycle$CycleCount
    ; $0006 = strz2word$next
    ; $0006 = strzlen$str
    ; $0008 = G_GetStringLine$spot
    ; $0009 = G_GetStringLine$key
    ; $000A = G_GetStringLine$y
    ; $000B = G_GetStringLine$strDataWord
    ; $000D = G_GetStringLine$allowLength
    ; $000E = G_GetStringLine$x
    ; $000F = G_GetStringLine$ln
    ; $0010 = G_GetStringLine$lp
    ; $0011 = G_GetStringLine$allowFound
    ; $0012 = X_KeyboardGetState$result
    ; $0013 = V_PutString$newLineChar
    ; $0014 = V_PutString$x2
    ; $0015 = V_PutString$y1
    ; $0016 = V_PutString$lx
    ; $0017 = V_PutString$color
    ; $0018 = V_PutString$s_spot
    ; $001A = V_PutString$x1
    ; $001B = V_PutString$ly
    ; $001C = V_PutString$y2
    ; $0021 = rand_seed
    ; $0023 = strz2word$result
    ; $0025 = strz2word$i
    ; $0026 = strz2word$char
    ; $0028 = main$ballCountString.array
    ; $0033 = main$pause
    ; $0035 = main$lp
    ; $0036 = main$ballCount
    ; $0038 = X_ModeGet$result
    ; $0039 = errno
    ; $003A = U_RandBetween$randNum
    ; $003B = U_RandBetween$HiNum
    ; $003C = U_RandBetween$LoNum
    ; $003D = strzlen$index
    ; $003E = V_SetArea$x2
    ; $003F = V_SetArea$y1
    ; $0040 = V_SetArea$lx
    ; $0041 = V_SetArea$color
    ; $0042 = V_SetArea$data
    ; $0043 = V_SetArea$x1
    ; $0044 = V_SetArea$ly
    ; $0045 = V_SetArea$y2
    ; $0046 = vera_poke$address
    ; $0049 = vera_poke$value
    ; $00FF = __zeropage_last
    ; $00FF = segment.himem_ff.bank
    ; $0100 = __zeropage_end
    ; $0100 = __zeropage_usage
    ; $080D = main
    ; $0817 = .fi__00096
    ; $0817 = main$GetBallCount
    ; $0891 = .cp__00098
    ; $0894 = .fi__00097
    ; $08B3 = .wh__00099
    ; $0903 = .fp__00101
    ; $0911 = .el__00103
    ; $0913 = .fi__00104
    ; $0916 = .ew__00102
    ; $0916 = .wh__00105
    ; $091A = .wh__00109
    ; $0929 = .sr__00115
    ; $0930 = .ss__00116
    ; $098D = .el__00117
    ; $099A = .fi__00118
    ; $099D = .el__00122
    ; $09C0 = .el__00119
    ; $09CD = .fi__00120
    ; $09CD = .fi__00121
    ; $09CD = .fi__00123
    ; $09E5 = .el__00124
    ; $09F2 = .fi__00125
    ; $09F5 = .el__00129
    ; $0A18 = .el__00126
    ; $0A25 = .fi__00127
    ; $0A25 = .fi__00128
    ; $0A25 = .fi__00130
    ; $0A34 = .sr__00133
    ; $0A3B = .ss__00134
    ; $0A83 = .fp__00111
    ; $0A91 = .el__00135
    ; $0A93 = .fi__00136
    ; $0A96 = .ew__00112
    ; $0AA1 = .fp__00107
    ; $0AA4 = .ew__00108
    ; $0AA5 = G_GetStringLine
    ; $0AE4 = .wh__00062
    ; $0AF0 = .th__00082
    ; $0B15 = .fi__00066
    ; $0B18 = .el__00080
    ; $0B28 = .el__00078
    ; $0B32 = .el__00076
    ; $0B4B = .wh__00067
    ; $0B5A = .fi__00071
    ; $0B5A = .fp__00069
    ; $0B5C = .he__00068
    ; $0B62 = .ew__00070
    ; $0B65 = .el__00072
    ; $0B69 = .fi__00073
    ; $0B82 = .fi__00074
    ; $0B82 = .fi__00075
    ; $0B82 = .fi__00077
    ; $0B82 = .fi__00079
    ; $0B82 = .fi__00081
    ; $0BC9 = .fi__00083
    ; $0BC9 = .fp__00064
    ; $0BCC = .ew__00065
    ; $0BCD = X_KeyboardGetState
    ; $0BD6 = __mod_u8u8u8u8
    ; $0BDB = __divmod_u8u8u8u8_start
    ; $0BE4 = __divmod_u8u8u8u8_skip
    ; $0BEA = X_PauseCycle
    ; $0BF5 = .wh__00033
    ; $0C02 = .fp__00035
    ; $0C02 = .he__00034
    ; $0C10 = .cp__00037
    ; $0C10 = .ew__00036
    ; $0C11 = V_PutString
    ; $0C3B = .wh__00013
    ; $0C5B = .fi__00021
    ; $0C66 = .fi__00022
    ; $0C66 = V_PutString$TestStringLocation
    ; $0C7A = .fi__00023
    ; $0CB5 = .fi__00028
    ; $0CE0 = .fp__00015
    ; $0CE3 = .ew__00016
    ; $0CE4 = strz2word
    ; $0CF4 = .wh__00084
    ; $0D06 = .fi__00088
    ; $0D0B = .fi__00089
    ; $0D13 = .co__00094
    ; $0D1B = .co__00095
    ; $0D4C = .cp__00091
    ; $0D50 = .fi__00090
    ; $0D5B = .el__00092
    ; $0D64 = .fi__00093
    ; $0D66 = .fp__00086
    ; $0D69 = .ew__00087
    ; $0D6E = __divmod_u16u16u16u16
    ; $0D7C = __divmod_u16u16u16u16_loop
    ; $0D98 = __divmod_u16u16u16u16_skip
    ; $0DA2 = rand
    ; $0DA6 = __rand_loop
    ; $0DAD = __no_eor
    ; $0DB3 = __mul_u16u8u16
    ; $0DB9 = __mul_u16u8u16_add
    ; $0DC2 = __mul_u16u8u16_loop
    ; $0DC6 = __mul_u16u8u16_start
    ; $0DCD = X_ModeGet
    ; $0DD5 = U_RandBetween
    ; $0DE3 = .fi__00001
    ; $0DEC = .fi__00002
    ; $0E14 = .el__00005
    ; $0E3A = .el__00003
    ; $0E3D = .fi__00004
    ; $0E3D = .fi__00006
    ; $0E40 = V_SetArea
    ; $0E5A = .wh__00048
    ; $0E7A = .fi__00056
    ; $0E85 = .fi__00057
    ; $0E96 = .fp__00050
    ; $0E99 = .ew__00051
    ; $0E9A = strzlen
    ; $0EA1 = .wh__00038
    ; $0EA3 = .fp__00040
    ; $0EA3 = .he__00039
    ; $0EA9 = .ew__00041
    ; $0EAC = vera_poke
    ; $0EC6 = main$allowChars.array
    ; $0ED1 = main$b.array
    ; $0EEA = main$BY.array
    ; $0EEA = segment.default.start
    ; $0FE9 = main$DX.array
    ; $10E8 = main$BX.array
    ; $11E7 = main$BC.array
    ; $12E6 = main$DY.array
    ; $13E5 = __heap_start
    ; $13E5 = segment.default.heapstart
    ; $2000 = segment.himem_00.length
    ; $2000 = segment.himem_ff.length
    ; $9016 = segment.default.length
    ; $9EFF = segment.default.end
    ; $A000 = segment.himem_00.heapstart
    ; $A000 = segment.himem_00.start
    ; $A000 = segment.himem_ff.heapstart
    ; $A000 = segment.himem_ff.start
    ; $BFFF = segment.himem_00.end
    ; $BFFF = segment.himem_ff.end