@ factorial program by tail recursion

fib2:
	cmp r2, #0
	bne gr8
		mov r1, r3
		mov pc, lr
	gr8:
		sub sp, sp, #12
		str lr, [sp, #0]
		str r3, [sp, #4]
		str r4, [sp, #8]
		sub r2, r2, #1
		add r4, r4, r3
		sub r3, r4, r3
		bl fib2
		add r2, r2, #1
		ldr lr, [sp, #0]
		ldr r3, [sp, #4]
		ldr r4, [sp, #8]
		add sp, sp, #12
		mov pc, lr

main:
	mov r0, #1
	loop:
		add r7, r7, #1
		mov r2, r7
		mov r3, #0
		mov r4, #1
		bl fib2
		mov r0, #1
		swi 0x6b
		mov r0, #' '
		swi 0x00
	cmp r7, #30
	bne loop 
	swi 0x11
