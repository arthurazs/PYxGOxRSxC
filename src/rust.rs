fn fib(n: u32) -> u32 {
    if n < 2 {
        n
    } else {
        fib(n - 1) + fib(n - 2)
    }
}

fn main() {
    let res: u32 = fib(37);

    println!("{}", res);
    println!("{}", res == 24157817);
}
