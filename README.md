Basic x86 Assembly I/O for Linux

Contained within io.asm are 3 functions for read/write to and from stdin and stdout.

example.asm provides an example of how to use these functions.

Compilation Using NASM under Linux

	nasm -f elf io.asm
	nasm -f elf example.asm

	ld -o example example.o io.o


