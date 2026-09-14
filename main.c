#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#include"safeio.c"
#include"lexer.c"
int main(void) {
	printf("Welcome to lambda calc!\nUse CTRL C to exit\n");
	while(1){
		printf(">_");
		char * input = getinput();
		free(input);
	}
	return 0;
}
