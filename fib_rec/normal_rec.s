@ fibonacci normal recursion program

fib:
	cmp r1, #2
	bgt gr8
		mov r2, #1
		mov pc, lr
	gr8:
		sub sp, sp, #8
		str lr, [sp, #4]
		str r4, [sp, #0]
		sub r1, r1, #1
		bl fib
		mov r4, r2
		sub r1, r1, #1
		bl fib
		add r2, r2, r4
		ldr lr, [sp, #4]
		ldr r4, [sp, #0]
		add sp, sp, #8
		add r1, r1, #2
		mov pc, lr
main:
	mov r0, #1
	loop:
		add r7, r7, #1
		mov r1, r7
		bl fib
		mov r0, #1
		mov r1, r2
		swi 0x6b
		mov r0, #' '
		swi 0x00
	cmp r7, #20
	bne loop 
	swi 0x11
