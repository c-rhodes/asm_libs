section .data
	prompt		db	"Enter your name: "
	PROMPT_SIZE	equ	$ - prompt

	greet		db	"Hello "
	GREET_SIZE	equ	$ - greet

	BUFFSIZE	equ	32

section .bss
	buff		resb	BUFFSIZE
	bytes_read	resb	1

section .text
	global		_start
	extern		print
	extern		read
	extern		print_nl
_start:
	push		PROMPT_SIZE
	push		prompt
	call		print
	add		esp,8

	push		BUFFSIZE
	push		buff
	call		read
	add		esp,8

	mov		[bytes_read],eax
	call		print_nl
	
	push		GREET_SIZE
	push		greet
	call		print
	add		esp,8

	push		BUFFSIZE
	push		buff
	call		print
	add		esp,8

	mov		eax,1
	mov		ebx,0
	int		80h

