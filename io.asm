section .data
SYS_WRITE	equ	4
SYS_READ	equ	3
STDIN		equ	0
STDOUT		equ	1

newline		db	10,0
NEWLINE_LEN	equ	$ - newline

section .text

global 	print
global	read
global 	print_nl

print:
	push	ebp
	mov	ebp,esp
	mov	eax,SYS_WRITE
	mov	ebx,STDOUT
	mov	ecx,[ebp + 8]
	mov	edx,[ebp + 12]
	int	80h

	mov	esp,ebp
	pop	ebp
	ret

read:
	push	ebp
	mov	ebp,esp
	mov	eax,SYS_READ
	mov	ebx,STDIN
	mov	ecx,[ebp + 8]
	mov	edx,[ebp + 12]
	int	80h

	mov	esp,ebp
	pop	ebp
	ret

print_nl:
	push	ebp
	mov	ebp,esp
	mov	eax,4
	mov	ebx,1
	mov	ecx,newline
	mov	edx,NEWLINE_LEN
	int	80h

	mov	esp,ebp
	pop	ebp
	ret
