#include <stdio.h>

int main() {
    int units, choice;
    float bill = 0;

    printf("Enter number of units consumed: ");
    scanf("%d", &units);

    printf("1. Calculate Electricity Bill");
    scanf("%d", &choice);

    switch(choice) {
        case 1:
            if(units <= 100) {
                bill = units * 5;
            } else if(units <= 200) {
                bill = (100 * 5) + (units - 100) * 7;
            } else {
                bill = (100 * 5) + (100 * 7) + (units - 200) * 10;
            }
            printf("Total Bill = ₹%.2f\n", bill);
            break;
        default:
            printf("Invalid choice!\n");
    }

return 0;
}



