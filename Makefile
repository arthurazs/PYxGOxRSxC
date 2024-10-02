.PHONY: all python gobuild go

all: python go

python:
	time python3 src/python.py
	echo -e "# PYTHON\n"

target/go.out: src/go.go
	go build -o target/go.out -ldflags "-s -w" src/go.go

gobuild: target/go.out

go: gobuild
	time target/go.out
	echo -e "# GO\n"

clean:
	rm target/*.out
