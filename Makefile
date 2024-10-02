SHELL = /usr/bin/fish
.PHONY: all python gobuild go rustc rust gcc c clean

all: python go rust c

python:
	time python3 src/python.py

target/go.out: src/go.go
	go build -o target/go.out -ldflags "-s -w" src/go.go

gobuild: target/go.out

go: gobuild
	time target/go.out

target/rust.out: src/rust.rs
	rustc -o target/rust.out -C debuginfo=0 -C opt-level=3 src/rust.rs

rustc: target/rust.out

rust: rustc
	time target/rust.out

target/c.out: src/c.c
	gcc -o target/c.out -O3 src/c.c

gcc: target/c.out

c: gcc
	time target/c.out

clean:
	rm target/*.out
