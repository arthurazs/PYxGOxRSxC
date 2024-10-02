def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)

res = fib(37)
print(res)
print(res == 24157817)
