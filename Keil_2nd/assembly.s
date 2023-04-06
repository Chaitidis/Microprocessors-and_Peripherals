	.global myadd
	.p2align 2
	.type myadd,%function
		
myadd: 

	.fnstart
	mov r1, #0
	mov r3, #0  //result register
	str r1, [sp, #0x0C] //initialize c
	add r4, sp, #0x7c
	
loop:
	ldrb r0, [r4, #0]//load character ascii value
	add r4, r4, #1
	cmp r0, #0  //return character detected
	bne continue
	str r3, [sp, #0x0c]
	bx lr
	
	
	
continue:
	cmp r0, #122  //end z
	bgt skip
	cmp r0, #48 //start 0
	blt skip
	//case character
	cmp r0, #96
	bgt character
	//case number
	cmp r0, #58
	blt number
	
	b skip
	

skip:
	add r3, r3, #12
	//strb r1, [sp, #0x13]
	b loop

character:
	sub r1, r0, #97  //get element position in table
	mov r2, #4
	mul r1, r1, r2
	add r1, r1, #0x14 //get the memory location relative to sp
	ldr r1, [sp, r1] //load value
	add r3, r3, r1
	//strb r1, [sp, #0x13]
	b loop

number:
	add r3, r3, r0
	sub r3, r3, #48
	//strb r0, [sp, #0x13] // #0x7C]
	b loop
	
.fnend
	