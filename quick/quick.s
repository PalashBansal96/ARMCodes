@ quick sort

split:
	ldr r7, [r5, r4]
	sub r6, r3, #4
	splitLoop:
		ldr r1, [r5, r3]
		cmp r1, r7
		bgt itFalse
			add r6, r6, #4
			ldr r2, [r5, r6]
			str r1, [r5, r6]
			str r2, [r5, r3]
			itFalse:
		add r3, r3, #4
	cmp r3, r4
	blt splitLoop
	add r6, r6, #4
	ldr r1, [r5, r6]
	ldr r2, [r5, r3]
	str r2, [r5, r6]
	str r1, [r5, r3]
	mov pc, lr

qSort:
	cmp r4, r3
	bgt gr8
		mov pc, lr
	gr8:
		sub sp, sp, #12
		str lr, [sp, #8]
		str r4, [sp, #4]
		str r3, [sp, #0]
		bl split
		sub sp, sp, #4
		str r6, [sp, #0]
		ldr r3, [sp, #4]
		ldr r4, [sp, #8]
		sub r6, r6, #4
		mov r4, r6
		bl qSort
		ldr r6, [sp, #0]
		ldr r4, [sp, #8]
		add r6, r6, #4
		mov r3, r6
		bl qSort
		ldr lr, [sp, #12]
		add sp, sp, #16
		mov pc, lr

main:
	mov r0, #0
	swi 0x6c
	mov r8, r0
	mov r6, #0
	mov r3, #4
	mul r2, r8, r3
	mov r8, r2
	sub sp, sp, r8
	mov r5, sp
	inputLoop:
		mov r0, #0
		swi 0x6c
		str r0, [r5, r6]
		add r6, r6, #4
	cmp r6, r8
	bne inputLoop
	mov r3, #0
	sub r4, r8, #4
	bl qSort
	mov r6, #0
	outputLoop:
		mov r0, #1
		ldr r1, [r5, r6]
		swi 0x6b
		mov r0, #' '
		swi 0x00
		add r6, r6, #4
	cmp r6, r8
	bne outputLoop
	swi 0x11