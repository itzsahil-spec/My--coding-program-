#include <stdio.h>
//salary of an employee
int main() {
    int choice;
    float basic, hra, da, pf, total;

    printf("Enter Basic Salary of Employee: ");
    scanf("%f", &basic);

    printf("\nChoose Employee Type:\n");
    printf("1. Manager\n");
    printf("2. Engineer\n");
    printf("3. Clerk\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch(choice) {
        case 1:  // Manager
            hra = 0.30 * basic;   // 30% HRA
            da  = 0.20 * basic;   // 20% DA
            pf  = 0.10 * basic;   // 10% PF
            break;

        case 2:  // Engineer
            hra = 0.25 * basic;   // 25% HRA
            da  = 0.15 * basic;   // 15% DA
            pf  = 0.08 * basic;   // 8% PF
            break;

        case 3:  // Clerk
            hra = 0.20 * basic;   // 20% HRA
            da  = 0.10 * basic;   // 10% DA
            pf  = 0.05 * basic;   // 5% PF
            break;

        default:
            printf("Invalid choice!\n");
            return 0;
    }

    total = basic + hra + da - pf;

    printf("\n----- Salary Slip -----\n");
    printf("Basic Salary  : %.2f\n", basic);
    printf("HRA           : %.2f\n", hra);
    printf("DA            : %.2f\n", da);
    printf("PF Deduction  : %.2f\n", pf);
    printf("--------------------------\n");
    printf("Total Salary  : %.2f\n", total);

    return 0;
}
