      NAME main
      PUBLIC main
      SECTION .text: CODE (2)
      THUMB

main:
       MOV R4, #0xAB   ; Load 0xAB into R4
       BL parcheckreg  ; Call parity function
       B STOP          ; Infinite loop at STOP

STOP:
       B STOP

parcheckreg:
       PUSH {R2, R4, LR}   ; Preserve registers (ascending order)
       AND R4, R4, #0xFF   ; Mask to 8-bit value
       MOV R2, #0          ; Clear parity counter
       
parity_loop:
       TST R4, #1          ; Test if LSB is 1 (sets flags)
       BEQ skip_increment  ; If zero flag is set (LSB was 0), skip increment
       ADD R2, R2, #1      ; Otherwise, increment R2

skip_increment:
       LSR R4, R4, #1      ; Shift R4 right by 1
       CMP R4, #0          ; Check if R4 is zero
       BNE parity_loop     ; Repeat if not zero

       AND R2, R2, #1      ; Keep only last bit (even/odd parity)
       POP {R2, R4, LR}    ; Restore registers (ascending order)
       BX LR               ; Return

      END                  ; End of the program
