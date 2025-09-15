#include<stdio.h>
int main (){
int i, first=0,second=1,n,next;
printf ("enter the range :");
scanf ("%d",&n);
printf ("fibonacci series");
for (i=1;i<=n;i++)
  {
  	printf ("%d\n",first);
  	next=first+
	  
	second;
  	first=second;
  	second=next;
  }
	return 0;
}