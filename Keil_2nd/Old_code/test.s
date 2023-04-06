	.global test
	.p2align 2
	.type factorial ,%function
		
test: 
	//start number in #0x13
	
	.fnstart
	
	add r0, r0, r1
	bx lr
	.fnend
	