#include <stdio.h>
#include <stdbool.h>

// alias a='clear && clang -o ./a c1.c && ./a'

int foo(int x, int y) {
	return x+y;
}

int main() {
	printf("hello advanced C\n");
	return 0;
}
