        .ORG $100
Init    LI   r1, BLUE
        LW   r2, r1, RED
        SUB  r1, r2, r1
        BRZ  DONE
DONE    STOP
RED     .EQU $0002
GREEN   .DW  $106
BLUE    .DW  $110
        .DW  $0012
PURPLE  .DW  DONE
