org 7c00h
	mov ax,cs
	mov ds,ax
	mov es,ax
	call DispStr
	jmp $ 
DispStr:
	mov ax,BootMessage
	mov bp,ax
	mov cx,16
	mov ax,01301h
	mov bx,00ch
	mov dl,0
	int 10h
	ret

BootMessage: db "Hello OS World!\n"	
times 510 - ($ -$$) db 0
dw 0xaa55

;key point:the 511st and 512nd byte should be aa and 55.the file size is not a matter
