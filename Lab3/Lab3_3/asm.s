        
  NAME    main
  PUBLIC  main
  SECTION .text : CODE (2)
  THUMB
  
  ;---------------- CODE HERE ----------------
  
  ; Store Program counter in R14 (LR) when performing BL SWAP
  ; BX LR return, same as MOV PC, LR
        
main
   Mov R4, #0x55
   BL parcheckreg   
   
   MOV R0, R2 
   BX LR 
   
        
parcheckreg
    MOV     R2, #0        
    AND     R4, R4, #0xFF 
    MOV     R3, #0  
    
    
count_loop
    CMP     R4, #0        
    BEQ     done_count   

    TST     R4, #1        
    ADDNE   R3, R3, #1    

    LSR     R4, R4, #1    
    B       count_loop    

done_count
    AND     R3, R3, #1    // Keep only the least significant bit (odd/even)
    MOV     R2, R3        // Return the result in R2 (0 for even, 1 for odd)
    BX      LR            // Return from the subroutine



  END