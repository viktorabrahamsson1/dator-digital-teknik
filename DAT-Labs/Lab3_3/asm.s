      NAME main
      PUBLIC main
      SECTION .text: CODE (2)
      THUMB
      
      
  ; Define SysTick register addresses
    SYSTICK_CTRL EQU 0xE000E010
    SYSTICK_LOAD EQU 0xE000E014
    SYSTICK_VAL  EQU 0xE000E018

    ; Define constants
    LOAD_VALUE   EQU 59999  ; 5 ms period with 12 MHz clock
    ENABLE_MASK  EQU 0x07   ; Enable SysTick, use processor clock, enable interrupt

    ENTRY

main
    ; Step 1: Turn off SysTick
    LDR R0, =SYSTICK_CTRL
    MOV R1, #0
    STR R1, [R0]

    ; Step 2: Reset SysTick counter
    LDR R0, =SYSTICK_VAL
    STR R1, [R0]

    ; Step 3: Set LOAD value
    LDR R0, =SYSTICK_LOAD
    LDR R1, =LOAD_VALUE
    STR R1, [R0]

    ; Step 4: Enable SysTick interrupt
    LDR R0, =SYSTICK_CTRL
    LDR R1, =ENABLE_MASK
    STR R1, [R0]

    ; Infinite loop to keep the program running
    B .

    END