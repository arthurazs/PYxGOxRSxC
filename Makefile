.PHONY: all python gobuild go gcc c clean

all: python go c

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

clean:
	rm target/*.out
