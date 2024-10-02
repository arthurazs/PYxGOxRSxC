# include <stdint.h>
# include <inttypes.h>
# include <stdio.h>

uint32_t fib(uint32_t n) {
    if (n < 2) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

int main() {
    uint32_t n = fib(37);
    printf("%" PRIu32 "\n", n);
    printf("%s\n", n == 24157817 ? "true" : "false");
    return 0;
}
