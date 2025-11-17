#include <stdio.h>

struct Distance {
    int feet;
    int inches;
};

int main() {
    struct Distance d1 = {900, 9};   // First distance
    struct Distance d2 = {500, 5};   // Second distance
    struct Distance total;

    // Add feet and inches
    total.feet = d1.feet + d2.feet;
    total.inches = d1.inches + d2.inches;

    // Convert inches to feet if >= 12
    if (total.inches >= 12) {
        total.feet += total.inches / 12;
        total.inches = total.inches % 12;
    }

    printf("Total Distance = %d feet %d inches\n", total.feet, total.inches);

    return 0;
}
