;=================================================
;Function : print_hex
;Does     : prints 2 byte value to TTY as 0x0000
;Input    : DX - Value to print
;Output   : none
;Destroys : none
;=================================================

print_hex:
  pusha               ;push all registers

  mov cx,5            ;CX as pointer to template
  .loop:
    mov ax,0x000F     ;mask to copy last nibble
    and ax,dx         ;copy last nibble into AX
    mov bx,HEX        ;point BX at HEX
    add bx,ax         ;add nibble offset to BX
    mov ax,[bx]       ;ascii of nibble to AX
    mov bx,cx         ;point BX at offset
    add bx,TEMPL      ;point BX at TEMPL + offset
    mov [bx],al       ;copy ascii into TEMPL
    shr dx,4          ;shift DX over by a nibble
    dec cx            ;decrement TEMPL pointer
    cmp cx,2          ;is TEMP pointer >= 2?
  jge .loop           ;repeat if true
  mov bx,TEMPL        ;put TEMPL address into BX
  call print_str      ;print TEMPL

  popa                ;pop all registers
ret

;DATA
HEX:
  db '0123456789ABCDEF'
TEMPL:
  db '0x0000',0xd,0xa,0
