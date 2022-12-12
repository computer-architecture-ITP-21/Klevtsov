C:\masm32\bin\ml.exe /c /coff /Fl lab3.asm
C:\masm32\bin\link.exe /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib\ lab3.obj
pause
del lab3.obj
start lab3.exe
