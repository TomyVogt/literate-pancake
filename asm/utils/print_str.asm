;=================================================
;Function : print_str
;Does     : prints a null-terminated string to TTY
;Input    : BX - Address of String
;Output   : none
;Destroys : none
;=================================================

print_str:
  pusha         ;push all registers

  mov ah,0xe   ;set TTY routine
  
  .loop:
    mov al,[bx] ;move letter to AL
    int 0x10    ;trigger interrupt
    inc bx      ;move to next letter
    cmp byte [bx],0  ;check for null termination
    jne .loop   ;repeat if not reached end

  popa          ;pop all registers
ret
