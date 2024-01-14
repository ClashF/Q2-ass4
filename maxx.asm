[org 0x0100]
	jmp start	

find:
	
	mov ax, [bx+si]
	mov dx, [bx+si+2]
	cmp ax,dx
	ja swap
	jmp continue
swap:
	mov dx, [bx+ si + 2]
	mov [bx + si], dx
	mov [bx + si + 2], ax

continue:
	add si, 2
	sub cx, 1
	cmp cx, 0
	jnz find       
	mov [result], ax
	ret

start:
	mov si, 0
	mov bx, a2
	mov cx, 9
	call find

	mov dx, [result]
	
	mov ax, 0x4c00
	int 0x21


a2: dw 32, 43, 12, 1, 78, 45, 34, 52, 76, 34

result: dw 0
