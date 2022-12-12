.386
.model flat, stdcall
option casemap:none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
Decc    dw 65
Negg    dw -160
Bin1    dd 1000111011b
Bin2    dd 1011110000b
Hex     dd 0ad456c4h
Text    db 'Good bye, America', 0
Array   dw 256, 765, 89, 654, 9

.data?
Bin3    dd ?

.code
start:

    mov eax, 0
    xor ebx, ebx

    mov eax, Bin1
    and eax, Bin2
    mov Bin3, eax

    push Decc
    push Negg
    pop Decc
    pop Negg
    
    invoke ExitProcess, NULL
end start