default:
	gcc -Wall -o prog main.c input.c
debug:
	gcc -Wall -o prog -g main.c input.c
clean:
	rm -f prog
