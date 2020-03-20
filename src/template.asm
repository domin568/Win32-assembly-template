[bits 32]

global _main
extern _MessageBoxA@16

section .data

paramText   DB  "Text!", 0
paramTitle  DB  "Title", 0

section .text

_main:

push ebp
mov ebp, esp
push 0x40
push paramTitle
push paramText
push 0
call _MessageBoxA@16
xor eax, eax
pop ebp
ret

