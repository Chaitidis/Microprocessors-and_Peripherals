	.global number_single
	.p2align 2
	.type number_single ,%function
	
	
number_single:
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
	