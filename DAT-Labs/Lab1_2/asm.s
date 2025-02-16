      NAME main
      PUBLIC main
      SECTION .text: CODE (2)
      THUMB
main
      MOV R0, # 0       ; (R0) <0
      MOV R1, # 0       ; (R1) <0


LOOP  CMP R1, # 9       ; compare (R1) to 9
      BNE ADD0          ; different> jump to ADD0
      MOV R1, # 0       ; reset (R1) to 0
      ADD R0, R0, # 7   ; update first: R0 = R0 + 7
      B CHECK           ; jump to CHECK


ADD0 ADD R0, R0, # 1    ; (R0) <(R0) + 1
     ADD R1, R1, # 1    ; (R1) <(R1) + 1
     
     
CHECK 
      CMP R0, #0x99     ; compare (R0) to 0x99 (Hexadecimal)
      BNE LOOP          ; different> jump to LOOP, repeat

STOP B STOP             ; infinite walk
     END