	.global factorial
	.p2align 2
	.type factorial ,%function
		
factorial: 
	
	
	.fnstart
	mov r1, r0   //save the input number	
	cmp r1, #0	 //if it is smaller than zero branch to zero procedure
	blt zero		
	mov r0, #1	 //initialize result register
loop:
	cmp r1, #0	 
	beq skip 		//factorial of zero equals 1 return
	mul r0, r0, r1	//multiply by number	
	sub r1, r1, #1	//subtract one 
	b loop			//continue recuresively
	
skip:
	bx lr
	
zero:
	mov r0, #0		//result zero
	bx lr
	
.fnend		
/*
factorial: 
	//start number in #0x0c
	
	.fnstart
	
	ldr r1, [sp, #0x0c]
	cmp r1, #0
	blt zero
	mov r2, #1
	str r2, [sp, #0x0c]
loop:
	cmp r1, #0
	beq skip 
	mul r2, r1, r2
	sub r1, r1, #1
	b loop
	
skip:
	str r2, [sp, #0x0c] //initialize c
	bx lr
	
zero:
	mov r2, #0
	str r2, [sp, #0x0c] //initialize c
	bx lr
	
.fnend
*/