      NAME main
      PUBLIC main
      
      SECTION .text: CODE (2)
      THUMB
main
      LDR R0, =Vector                   ; load the base register of vector
      LDR R6, [R0]                      ; Load the first element in vector to R6
      LDR R7, [R0]                      ; Load the first element in vector to R7
      MOV R1, # 4                       ; Set R1 to 4
      
      
LOOP
      LDR R2, [R0,R1]                   ; Set R2 to the address of (R0 + R1)
      ADD R1,R1, # 4                    ; Increament R1 by 4
      
      CMP R6, R2                        ; Compare R6 (lowest) to R2
      BGT SETMIN                        ; If R6 > R2 branch to SETMIN
      
      CMP R7, R2                        ; Compare R7 (largest) to R2
      BLT SETMAX                        ; If R7 < R2 branch to SETMAX   
      
      
      CMP R1,# 80                       ; Compare R1 to 80
      
      BLT LOOP                          ; If R1 < 80 branch to LOOP
      B STOP                            ; Branch to STOP
       
      
      
SETMIN
        MOV R6, R2                      ; Set the value of R2 to R6 (smallest value)
        B LOOP                          ; Branch LOOP


SETMAX
        MOV R7, R2                      ; Set the value of R2 to R7 (largest value)
        B LOOP                          ; Branch LOOP
                      

STOP 
        B STOP                          ; Branch STOP (infinite walk)
        
        
        ALIGNROM 2
        DATA
       

Vector
      DC32 14, 25, 2, 27, 3
      DC32 22, 13, 4, 24, 6
      DC32 26, 18, 8, 15, 9
      DC32 28, 10, 7, 17, 5
          
     
      END



   
      
