#include<stdio.h>
int main(){
    int n,rem,rev=0,original;
    printf("Enter a number: ");
    scanf("%d",&n);
    original=n;
    while(n!=0){
        rem =n%10;
        rev=rev*10+rem;
        n=n/10;
    }
    if(original==rev){
        printf("this number is pallindrome");
    }else{
        printf("this number is not pallindrome");
    }
    return 0;
}