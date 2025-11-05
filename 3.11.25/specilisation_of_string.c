#include <stdio.h>
#include <string.h>

int main() {
    char str1[100], str2[100], copyStr[100], concatStr[200];
    int length, cmp;

    // Input string 1
    printf("Enter first string: ");
    fgets(str1, sizeof(str1), stdin);

    // Remove newline (if present)
    str1[strcspn(str1, "\n")] = '\0';

    // Input string 2
    printf("Enter second string: ");
    fgets(str2, sizeof(str2), stdin);
    str2[strcspn(str2, "\n")] = '\0';

    ///-------------------------------------------
    // a) Find length of string
    ///-------------------------------------------
    length = strlen(str1);
    printf("\nLength of first string: %d\n", length);

    ///-------------------------------------------
    // b) Copy one string into another
    ///-------------------------------------------
    strcpy(copyStr, str1);
    printf("Copied string: %s\n", copyStr);

    ///-------------------------------------------
    // c) Compare two strings
    ///-------------------------------------------
    cmp = strcmp(str1, str2);
    if (cmp == 0)
        printf("Strings are equal.\n");
    else if (cmp > 0)
        printf("First string is greater.\n");
    else
        printf("Second string is greater.\n");

    ///-------------------------------------------
    // d) Concatenate string
    ///-------------------------------------------
    strcpy(concatStr, str1);  // copy str1 to concatStr
    strcat(concatStr, str2);  // append str2
    printf("Concatenated string: %s\n", concatStr);

    return 0;
}
