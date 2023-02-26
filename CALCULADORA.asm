%include "io.inc"
extern _scanf
extern _prinf

section .data
scanfFmt: db "%d %d %d", 0x00
printSoma: db "O resultado da soma e: ", 0x0d, 0x00
printSub: db "O resultado da subtracao e: ", 0x0d, 0x00
printDiv: db "O resultado da divisao e: ", 0x0d, 0x00
printMult: db "O resultado da multiplicacao e: ", 0x0d, 0x00
printR: db "%d", 0x0d, 0x00


section .bss
valor1 resd 1
valor2 resd 1
op resd 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp
    push valor1
    push valor2
    push op
    push scanfFmt
    call _scanf
    add esp, 16
    
    f_soma:
        cmp dword[op], 1
        jz soma
    f_subtracao: 
        cmp dword[op], 2
        jz subtracao
    f_mult:
        cmp dword[op], 3
        jz multiplicacao
    f_divisao:
        cmp dword[op], 4
        jz divisao 
            
    f_sair:
    xor eax, eax
    ret
    
soma:
    push printSoma
    call _printf
    add esp, 4
    
    mov eax, dword[valor1]
    mov ebx, dword[valor2]
    add eax, ebx
    push eax
    push printR
    call _printf
    add esp, 8
    jmp f_sair
   
subtracao:
    push printSub
    call _printf
    add esp, 4
    
    mov eax, dword[valor1]
    mov ebx, dword[valor2]
    sub eax, ebx
    push eax
    push printR
    call _printf
    add esp, 8
    jmp f_sair
    
multiplicacao:
    push printMult
    call _printf
    add esp, 4
    
    mov eax, dword[valor1]
    mov ebx, dword[valor2]
    mul ebx
    push eax
    push printR
    call _printf
    add esp, 8
    jmp f_sair
    
divisao:
    push printDiv
    call _printf
    add esp, 4
    
    mov eax, dword[valor2]
    mov ebx, dword[valor1]
    mov bh, 0
    div bl
    
    mov ebx, eax
    mov ah, 0
    movzx eax, al
    push eax
    push printR
    call _printf
    add esp, 8
    
    mov eax, ebx
    mov al, 0
    movzx eax, ah
    push eax
    push printR
    call _printf
    add esp, 8
    
    jmp f_sair
    
    
    
    
    
    
    
    
    
    
    
    
    