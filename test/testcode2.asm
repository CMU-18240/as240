; Compute a 9-sided magic square, using RISC240 assembly language

        .ORG $FF0   ; Input Data
SIDE    .DW  $9     ; Size of the Magic Square
SQUARE  .DW  $51    ; SIDE * SIDE (yep, doing the multiplication myself)
BASE    .EQU $2000  ; Base address of destination array

        .ORG $1000  ; Code segment
        ; Initialize array to zeros
        LW   r7, SIDE
        LW   r6, SQUARE
        SLLI r6, r6, $1     ; Double r6, for word alignment
L_INIT  SW   r6, r0, BASE   ; Store zero at Base + r6
        ADDI r6, r6, $FFFE  ; Subtract two (next word)
        BRZ  D_INIT
        BRA  L_INIT
        
        ; c = self.side // 2
D_INIT  LW   r1, SIDE       ; Column counter in r1
        SRLI r1, $1         ; Divide by 2
        
        ;r = self.side // 2 + 1
        LW   r2, SIDE       ; Row counter in r2
        SRLI r2, $1
        ADDI r2, r2, $1 
        
        ; for i in range(1,self.side*self.side+1):
        LI   r3, $1         ; Magic value counter in r3 (to store)
        
BIGLP   ; self.memory[self.base + r * self.side + c] = i
        MV   r4, r2         ; Address value in r4
        SLLI r4, $3         ; row * 8
        ADD  r4, r4, r2     ; row * 8 + row = row * 9
        ADD  r4, r4, r1     ; row * 9 + col
        SLLI r4, r4, $1     ; double r4 (word alignment)
        SW   r4, r3, BASE   ; Store i to base + row * 9 + col
                            ; Done with r4, can reuse
        ; next_c = (c + 1) 
        ADDI r5, r1, $1     ; next_c in r5
        
        ; if next_c >= self.side:
        ;     next_c -= self.side
        SLT  r0, r5, r7
        BRN  D_NEXTC
        SUB  r5, r5, r7
D_NEXTC 
        ; next_r = (r + 1)
        ADDI r6, r6, $1     ; next_r in r6
        
        ; if next_r >= self.side:
        ;     next_r -= self.side
        SLT  r0, r6, r7
        BRN  D_NEXTR
        SUB  r6, r6, r7
D_NEXTR

        ; if self.memory[self.base + next_r * self.side + next_c] == 0:
        MV   r4, r6
        SLLI r4, $3
        ADD  r4, r6
        ADD  r4, r5
        SLLI r4, r4, $1    ; Double r4 (word alignment)
        LW   r0, r4, BASE  ; Throwing away read value.  I only care if it is 0
        BRZ  IS_ZERO
        BRA  NOT_ZERO
        
IS_ZERO ; c = next_c
        MV   r1, r5
        ; r = next_r
        MV   r2, r6
        BRA  RANGE

NOT_ZERO ; r += 2
        ADDI r2, r2, $2
        ; if r >= self.side:
        ;     r -= self.side
        SLT  r0, r2, r6
        BRN  RANGE
        SUB  r2, r2, r6
       
RANGE   ADDI r3, r3, $1
        LW   r6, SQUARE
        SLT  r0, r3, r6
        BRN  BIGLP
        BRZ  BIGLP
        
        STOP 
        
        