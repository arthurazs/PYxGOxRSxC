.PHONY: all python

all: python

python:
	time python3 src/python.py
	echo -e "# PYTHON\n"
