# include <stdint.h>
# include <stdio.h>

unsigned long fib(unsigned long n) {
    if (n < 2) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

int main() {
    unsigned long n = fib(37);
    printf("%lu\n", n);
    printf("%s\n", n == 24157817 ? "true" : "false");
    return 0;
}
