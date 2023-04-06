	.global single_digit_conversion
	.p2align 2
	.type single_digit_conversion ,%function

single_digit_conversion: 
	.fnstart
	
	recursive:
	mov r1, #0			//r1 quotient
	mov r2, #0			
	
	continue:
	cmp r0, #10			
	blt remainder 		//number smaller than 10
						//continuosuly subtract 10 until r1<10
	add r1, r1, #1
	sub r0, r0, #10
	b continue
	
	//when remainder is called r1 has the quotient and r0 the remainder
remainder:
	add r2, r0  //r2 has the remainder
	mov r0, r1	//r0 has the quotient

	//to continue the execution a new remainder of zero is placed
	mov r1, #0	//new remainder
	
	//if the quotient is greater than 10 calculate the sum of its digits
	cmp r0, #10
	
	bgt continue
	
	add r2, r2, r0	//add the final digit to the result
	cmp r2, #9		//if the result is greater than 10 repet 
	mov r0, r2		//r0 is the new number
	bgt recursive
	bx lr

.fnend
	
*/
single_digit_conversion: 
	//start number in #0x0C
	
	.fnstart
	//digit in 
	ldr r0, [sp, #0x0c]
	
	recursive:
	mov r1, #0
	mov r2, #0
	//mov	r1, 13
	continue:
	cmp r0, #10
	
	blt remainder //r1 smaller than 10
	
	add r1, r1, #1
	sub r0, r0, #10
	b continue
	

remainder:
	add r2, r0  //5 in r1
	mov r0, r1	//13 in r2 swap

	//now 13 is in r1
	//5 in r2
	mov r1, #0
	cmp r0, #10
	
	bgt continue
	add r2, r2, r0
	cmp r2, #9
	mov r0, r2
	bgt recursive
	str r2, [sp, #0x0c] //result in r2
	bx lr

.fnend
