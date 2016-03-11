#include "stdio.h"

int main(){
	int a=0, b=1, i=0, n;
	scanf("%d",&n);
	do {
		a = a+b;
		b = a-b;
		printf("%d ",a);
		i++;
	} while(i!=n);
	return 0;
}