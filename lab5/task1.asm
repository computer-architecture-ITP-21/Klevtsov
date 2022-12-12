.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
a dw 5
b dw 2
k dw 3

.code ; b = (a^2 - b^2)/2 +a*(k +1)
start:
	mov ax, a  			; AX=a
	imul a     			; AX=AX*a 
	mov bx, ax			; BX=AX     =(a^2)
	
	mov ax, b			; AX=b
	imul b				; AX=AX*b   =(b^2)
	sub bx, ax			; BX=BX-AX  =(a^2-b^2)
	
	mov ax, bx			; AX=BX 	=(a^2-b^2)
	mov cx, 2			; CX=2
	idiv cx				; AX=AX/CX  =(a^2-b^2)/2
	mov bx,ax			; BX=AX		=(a^2-b^2)/2
	
	mov ax, k			; AX=k       
	add ax, 1			; AX=k+1
	imul a				; AX =a*(k+1)
	
	add ax,bx			; AX=AX+BX  =(a^2-b^2)/2 + a*(k+1)
	mov b, ax			; b=(a^2-b^2)/2 + a*(k+1) , там где деление на 2, будет округление 10.5=>10
; b = (5*5 - 2*2)/2 + 5*(3+1) = 10 + 20=30
; В результате выполнения программы в отладчике B = E1 00, E1(16-ричн.) =30(десятич)
    invoke ExitProcess, NULL		
end start