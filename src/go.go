package main

import "fmt"

func fib(n uint32) uint32 {
    if n < 2 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

func main() {
    var res uint32 = fib(37)
    fmt.Println(res)
    fmt.Println(res == 24157817)
}
