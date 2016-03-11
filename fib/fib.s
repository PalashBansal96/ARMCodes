@ fibonacci program

.equ SWI_PrInt, 0x6b
.equ SWI_RdInt, 0x6c
.equ SWI_Exit, 0x11
.equ SWI_PrChr, 0x0

mov r7, #0 @ r7 = i
mov r0, #0
SWI SWI_RdInt   @ Please add a file in stdin with int, it won't prompt
mov r6, r0 @ r6 = n
mov r1, #0 @ r1 = a
mov r2, #1 @ r2 = b
CMP r6, #0
BNE LOOP
mov r6, #20
LOOP:
	ADD r1, r2, r1
	SUB r2, r1, r2
	mov r0, #1
	SWI SWI_PrInt
	mov r0, #' '
	SWI SWI_PrChr
	ADD r7, r7, #1
CMP r7, r6
BNE LOOP
SWI SWI_Exit