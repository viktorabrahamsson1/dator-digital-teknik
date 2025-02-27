        
  NAME    main
  PUBLIC  main
  SECTION .text : CODE (2)
  THUMB
  
  ;---------------- CODE HERE ----------------
  
  ; Store Program counter in R14 (LR) when performing BL SWAP
  ; BX LR return, same as MOV PC, LR
        
main
  Mov R2, #0x00AC
  LDR R1, =0xFF554400
  BL SWAP
        
STOP    B STOP
        
SWAP    PUSH {R2}   
  LSR R0, R1, # 24
  AND R2, R1, # 0xFF0000
  ORR R0, R0, R2, LSR #8
  AND R2, R1, #0xFF00
  ORR R0, R0, R2, LSL #8
  ORR R0, R0, R1, LSL #24
  POP {R2}
  BX LR


  END