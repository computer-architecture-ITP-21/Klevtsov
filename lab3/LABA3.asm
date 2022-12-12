.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\windows.inc 
include C:\masm32\include\kernel32.inc 
includelib C:\masm32\lib\kernel32.lib

.data
string	        db "Hello World!", 0Ah, 0h
sConsoleTitle	db "Му first project", 0

.data? 
stdout          dd ?
cWritten        dd ?

.code
start:
	push offset sConsoleTitle
	call SetConsoleTitle
	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov stdout, eax
	mov cWritten, ebx
	push NULL
	push offset cWritten
	push sizeof string
	push offset string
	push stdout
	call WriteConsole
	push INFINITE
	call Sleep
	push NULL
	call ExitProcess
end start
