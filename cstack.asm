section .text
    global _start

_start:
    ; Take 10 characters as input and push onto the stack
    mov cx, 10

input_loop:
    mov ah, 0       ; BIOS interrupt: Check for Key Press
    int 16h         ; Invoke BIOS interrupt
    jz input_loop   ; Jump back if no key pressed

    mov ah, 1
    int 16h         ; BIOS interrupt: Input character

    ; Check if Enter (ASCII 13) was pressed
    cmp al, 13
    je end_input

    push ax
    loop input_loop

end_input:
    ; Pop and display characters in reverse order
pop_loop:
    pop ax
    ; Check for end of stack
    cmp ax, 0
    je end_program
    ; Display the character
    mov ah, 2
    int 21h
    jmp pop_loop

end_program:
    ; Exit program
    mov ah, 4Ch
    int 21h