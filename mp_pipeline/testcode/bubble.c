#include <stdbool.h>

void swap(volatile char* xp, volatile char* yp)
{
    volatile char temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void bubbleSort(volatile char arr[], char n)
{
    char i, j;
    bool swapped;
    for (i = 0; i < n - 1; i++) {
        swapped = false;
        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j + 1]);
                swapped = true;
            }
        }
        if (swapped == true) {
            break;
        }
    }
}

int main() {
    volatile char a[] = {64,34,25,12,22,11,90};
    char n = sizeof(a) / sizeof(a[0]);
    bubbleSort(a, n);
}