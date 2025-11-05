#include<stdio.h>
int sum();
int main(){
    printf("%d",sum());
    return 0;
}
   
int sum(){
    int i,sum=0;
    for(i=0;i<=10;i=i+2){
    
        sum=sum+i;
    }
    return sum;

}
    