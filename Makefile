.PHONY: all python gobuild go gcc c rustc rust clean

all: python go c rust

python:
	time python3 src/python.py
	echo -e "# PYTHON\n"

target/go.out: src/go.go
	go build -o target/go.out -ldflags "-s -w" src/go.go

gobuild: target/go.out

go: gobuild
	time target/go.out
	echo -e "# GO\n"

target/c.out: src/c.c
	gcc -o target/c.out src/c.c

gcc: target/c.out

c: gcc
	time target/c.out
	echo -e "# GCC\n"

target/rust.out: src/rust.rs
	rustc -o target/rust.out -C debuginfo=0 -C opt-level=3 src/rust.rs

rustc: target/rust.out

rust: rustc
	time target/rust.out
	echo -e "# RUST\n"

clean:
	rm target/*.out
