#include <stdio.h>

int main() {
    int number, lastDigit;

    // Ask user to enter an integer
    printf("Enter an integer: ");
    scanf("%d", &number);

    // Use modulus operator to get the last digit
    lastDigit = number % 10;

    // Handle negative numbers
    if (lastDigit < 0) {
        lastDigit = -lastDigit;
    }

    // Display the result
    printf("The last digit of %d is %d\n", number, lastDigit);

    return 0;
}