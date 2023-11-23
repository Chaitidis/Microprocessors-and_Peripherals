# Μικροεπεξεργαστές και Περιφερειακά (Microprocessors and Peripherals)
## Εαρινό εξάμηνο (Summer Semester) 2022-2023
### First Lab
--------
#### Δημήτριος Χαϊτίδης (Dimitrios Chaitidis) (ΑΕΜ: 9310)
#### Email: chaitidi@ece.auth.gr
---------
#### Δημήτριος Κωνσταντινίδης (ΑΕΜ:10106)
#### Email: dakonstan@ece.auth.gr

<br/>

<br/>

## Description
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In this lab we are asked to implement a routine in assembly of an ARM microcontroller using the Keil tools. Programming in assembly involves generating the hash of an alphanumeric. To implement this we also had to create a program in C and then we call the subroutines to compute the hash, which are written in assembly. The result is displayed via UART using the appropriate function.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The implementation of the requests is done using 3 Assembly Scripts and 1 C Script, each for the implementation of one request of the task. The results are in the following:
* factorial.s  
* ascii_conversion.s 
* number_single.s 
* main.c

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First in C we defined the necessary libraries for the implementation of the requested program as defined in the paper, namely UART. There we read the alphanumeric through a scanf function and also define the table for converting a character to the given value. UART is used to display the result using **uart_print**,but because it takes an alphanumeric as an argument, sprintf is used beforehand to concatenate an alphanumeric with the int of the result into a new alphanumeric.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Furthermore, the connection between the C routine and Assembly had to be made, which is done using :
* extern int ascii_conversion(int* result, char* str, int* character_value);
* extern int number_single(int result);
* extern int factorial(int result);

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Also in the Assembly code we need to define the following (e.g. for the factorial function in this case):
* .global factorial &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(We set it as global so that it can be called externally)
* .p2align 2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (The alignment of the location counter is done)
* .type factorial ,%function (Definition of the function)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In **ascii_conversion.s** is used to convert the alphanumeric from ASCII values to an integer by adding and subtracting the corresponding numbers for each character. Although initially the address of the tables was found with the disassembler and the appropriate memory locations were written/read in the assembly. With this approach if new variables are created the memory addresses of each variable can be changed and lead to incorrect results. So the function takes as argument 3 pointers, of the 2 tables and the final storage address of the result. The conversion procedure is as follows:
* We check each element of the alphanumeric if it is a number and then check if it is an acceptable character. Otherwise the "alphanumeric" is ignored and we move on to the next one. In case of a number, it is subtracted from the total, in case of a character, the corresponding number is added according to the table given. Here we were confronted with how to correctly identify the alphanumeric and then implement the task at hand. The alphanumeric in the assembly is given with a pointer, pointing to the beginning of the first memory location of the table, and the characters are represented by the ASCII value of each character. The (Latin) characters in ASCII value have consecutive values, so by subtracting the first value of the sequence in ASCII (of character a) we get the character's position in the conversion table. The same is done with numbers by subtracting the ASCII value of zero.
* This process continues by increasing the pointer address by 1. Execution stops when a terminal character is found, i.e. 10. Admittedly, it was not particularly demanding.
* 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In **number_single.s** the process is implemented in which the digits of the number are continuously added until the result becomes a single digit. To find the consecutive digits of a number, consecutive integer divisions by 10 are performed and each time the last digit is isolated as the remainder. The quotient is the remaining digits of the number.
The implementation of this particular script was our biggest problem. The main ideas for this were three. 
*The *first* had to do with using the command of dividing the number by 10 to subtract the last digit and then adding it to the result.
* The *second* had to do with using logic, i.e. using bits and instructions such as AND to isolate bytes and then adding them to the remaining digits of the number. Although it worked for some inputs, it didn't work for some others.
* The third was the one that was finally implemented is that of consecutive subtractions of 10 until no more can be performed. The sum of the subtractions is the quotient and the remainder of the subtractions is the remainder of the division by 10. As the sum of the digits is not necessarily a one-digit number, this process is repeated until a one-digit number is obtained.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In **factorial.s** the factorial of the final single digit number resulting from number_single.s is implemented. The original number is held in a register, and the result is initialized to 1. We then multiply the result by the original number and then subtract a unit from it. The process is repeated until we get to 1. In the case of a negative number, the result is zero.
Also the problems of the above script were not an inhibiting factor in its implementation, as the procedure is very simple.

## Observations
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; During the implementation of the 1st workshop project we were confronted with a new environment (Keil). We practiced our knowledge in C but mainly in Assembly. The routines implemented would not be described as "difficult" , however in this case the use of Assembly did not help us much. It was particularly interesting our first contact with programming a microcontroller as much as the use of UART to communicate with it. 


	
