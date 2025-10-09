# include<stdio.h>
//To create simple calculator
int main() {
	float num1,num2;
	int choice;
	printf("Menu........\n");
	printf("1.Addition\n");
	printf("2.substruction\n");
	printf("3.multipication\n");
	printf("4.division\n");
	printf("5.exit......\n");
	
	printf("enter the value of number1: ");
	scanf("%f",&num1);
	printf("enter the value of number2: ");
	scanf("%f",&num2);
	printf("enter the choice(1-5) : ");
	scanf("%d",&choice);
	switch (choice) {
		case 1:{ printf("result is %0.2f",num1+num2);
	    break;}
		case 2:{ printf("result is %0.2f",num1-num2);
		break;}
		case 3:{ printf("result is %0.2f ",num1*num2);
	    break;}
	    case 4:{ if (num2!=0){
			printf("result is %0.2f",num1/num2);
		}else{
			printf("does not exist");
		}break;}
		case 5: {
			printf("exiting program.......");
			break;
		}
		
		
	    default:{printf("please right choice..");
	    }
		}
		return 0;
		
	}
	
	
	
	
