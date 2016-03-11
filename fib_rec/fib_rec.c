#include <stdio.h>

int fib(int a){
	if(a<=2)return 1;
	return fib(a-1)+fib(a-2);
}

int fib2(int n, int a, int b){
	if(!n) return a;
	else return fib2(n-1, b, a+b);
}

int main(){
	int i, n=20;
	for(i=1;i<n;i++){
		printf("%d %d\n",fib(i), fib2(i, 0, 1));
	}
	return 0;	
}