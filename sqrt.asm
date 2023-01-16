;Aggam Rahamim
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
    smaller db 0
    final db 0  ; final result
    num db 9  ; number to sqrt
CODESEG
proc sqrt
    xor cx, cx
    mov cl, 1
sqrtLoop:
    xor ax, ax
    mov al, cl
    mul cl
    cmp al, [num]
    ja sqrtAbove
    je sqrtEqual
sqrtSmaller:
    mov [smaller], cl
    jmp contLoop
sqrtAbove:
    xor ax, ax
    mov al, cl
    add al, [smaller]
    mov bl, 2
    div bl
    mov [final], al
    jmp endLoop
sqrtEqual:
    mov [final], cl
    jmp endLoop
contLoop:
    inc cl
    cmp cl, [num]
    jb sqrtLoop
endLoop:
    ret
endp
start:
    mov ax, @data
    mov ds, ax
; --------------------------
; Your code here
; --------------------------
    mov [num], 49  ; number to sqrt
    call sqrtLoop
  
exit:
    mov ax, 4C00h
    int 21h
END start