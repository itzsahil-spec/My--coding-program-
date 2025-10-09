#include <stdio.h>

int main() {
    int marks, choice;

    printf("Enter student marks: ");
    scanf("%d", &marks);

    printf("1. Display Grade\n");
    scanf("%d", &choice);

    switch(choice) {
        case 1:
            switch(marks / 10) {
                case 10:
                case 9:
                    if(marks >= 95)
                        printf("Grade: A+\n");
                    else
                        printf("Grade: A\n");
                    break;
                case 8:
                    printf("Grade: B\n");
                    break;
                case 7:
                    printf("Grade: C\n");
                    break;
                default:
                    printf("Grade: F\n");
            }
            break;
        default:
            printf("Invalid choice!\n");
    }

return 0;
}
