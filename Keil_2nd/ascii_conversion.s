	.global ascii_conversion
	.p2align 2
	.type ascii_conversion,%function
		
ascii_conversion: 

	.fnstart
	//mov r4, r1  //r1 start of string pointer
	//mov r6, r2  //r2 start of conversion values pointer
	//mov r7, r0  //r0 d adress pointer
	//mov r1, #0
	mov r4, #0  //initialize result register
	
	
loop:
	//increment after load
	ldrb r3, [r1], #1 //load character ascii value at adress r4 increment r1 afterwards
	//add r1, r1, #1	//increment adress for next character
	cmp r3, #0  	//return character detected
	bne continue
	str r4, [r0]	//store result[sp, #0x0c]
	bx lr			//return
	
	
	
continue:
	cmp r3, #122  //end z
	bgt loop  //skip
	cmp r3, #48 //start 0
	blt loop //skip
	
	//case character
	cmp r3, #96
	bgt character
	
	//case number
	cmp r3, #58
	blt number
	
	//other character
	b loop //skip
	
/*
skip:
	add r4, r4, #0
	//strb r1, [sp, #0x13]
	b loop
*/
character:
	sub r3, r3, #97  //get element position in table
	//mov r6, #4		 
	//mul r5, r5, r6   //get adress relative to the start pointer
	ldr r3, [r2, r3, LSL#2] //load value
	add r4, r4, r3
	b loop

number:
	sub r4, r4, r3
	add r4, r4, #48
	//strb r0, [sp, #0x13] // #0x7C]
	b loop
	
.fnend








/*
	.global ascii_conversion
	.p2align 2
	.type ascii_conversion,%function
		
ascii_conversion: 

	.fnstart
	mov r4, r1  //start of string pointer
	mov r6, r2	//start of conversion values pointer
	mov r7, r0  //d adress pointer
	mov r1, #0
	mov r3, #0  //result register
	
	
loop:
	//increment after load
	ldrb r0, [r4]   //load character ascii value at adress r4
	add r4, r4, #1	//increment adress for next character
	cmp r0, #0  	//return character detected
	bne continue
	str r3, [r7]	//store result[sp, #0x0c]
	bx lr			//return
	
	
	
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
	
	//other character
	b skip
	

skip:
	add r3, r3, #0
	//strb r1, [sp, #0x13]
	b loop

character:
	sub r1, r0, #97  //get element position in table
	mov r2, #4		 
	mul r1, r1, r2   //get adress relative to the start pointer
	ldr r1, [r6, r1] //load value
	add r3, r3, r1
	b loop

number:
	sub r3, r3, r0
	add r3, r3, #48
	//strb r0, [sp, #0x13] // #0x7C]
	b loop
	
.fnend
	.global ascii_conversion
	.p2align 2
	.type ascii_conversion,%function
		
ascii_conversion: 

	.fnstart
	mov r4, r1  //start of string pointer
	mov r6, r2	//start of conversion values pointer
	mov r7, r0  //d adress pointer
	mov r1, #0
	mov r3, #0  //result register
	
	
loop:
	//increment after load
	ldrb r0, [r4]   //load character ascii value at adress r4
	add r4, r4, #1	//increment adress for next character
	cmp r0, #0  	//return character detected
	bne continue
	str r3, [r7]	//store result[sp, #0x0c]
	bx lr			//return
	
	
	
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
	
	//other character
	b skip
	

skip:
	add r3, r3, #0
	//strb r1, [sp, #0x13]
	b loop

character:
	sub r1, r0, #97  //get element position in table
	mov r2, #4		 
	mul r1, r1, r2   //get adress relative to the start pointer
	ldr r1, [r6, r1] //load value
	add r3, r3, r1
	b loop

number:
	sub r3, r3, r0
	add r3, r3, #48
	//strb r0, [sp, #0x13] // #0x7C]
	b loop
	
.fnend

	.global ascii_conversion
	.p2align 2
	.type ascii_conversion,%function
		
ascii_conversion: 

	.fnstart
	mov r4, r1  //start of string pointer
	mov r6, r2	//start of conversion values pointer
	mov r7, r0  //d adress pointer
	mov r1, #0
	mov r3, #0  //result register
	
	
loop:
	//increment after load
	ldrb r0, [r4]   //load character ascii value at adress r4
	add r4, r4, #1	//increment adress for next character
	cmp r0, #0  	//return character detected
	bne continue
	str r3, [r7]	//store result[sp, #0x0c]
	bx lr			//return
	
	
	
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
	
	//other character
	b skip
	

skip:
	add r3, r3, #0
	//strb r1, [sp, #0x13]
	b loop

character:
	sub r1, r0, #97  //get element position in table
	mov r2, #4		 
	mul r1, r1, r2   //get adress relative to the start pointer
	ldr r1, [r6, r1] //load value
	add r3, r3, r1
	b loop

number:
	sub r3, r3, r0
	add r3, r3, #48
	//strb r0, [sp, #0x13] // #0x7C]
	b loop
	
.fnend

*/