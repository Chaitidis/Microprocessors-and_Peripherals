#include <stdio.h>
#include <uart.h>

extern int ascii_conversion(int* result, char* str, int* character_value);
extern int number_single(int result);
extern int factorial(int result);

int main(){
	
	char str[128];
	int character_value[26] = {10,42,12,21,7,5,67,48,69,2,36,3,19,1,14,51,71,8,26,54,75,15,6,59,13,25};
	int result;
	
	uart_init(115200);
	uart_enable();
	
	while(1){
		printf("Enter a string: ");
		scanf("%s", str);
		printf("\nYou entered: %s\n", str);
		
		ascii_conversion(&result, str, character_value);
		printf("\nResult of conversion is: %d\n", result);
		result = number_single(result);
		printf("\nSingle digit is: %d\n", result);
		result = factorial(result);
		
		printf("\r\nResult is: %d\n", result);
		sprintf(str,"\r\nResult is: %d", result);
		uart_print(str);

	}
	
	return 0;
}
