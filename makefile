default:
	gcc -Wall -o prog main.c
debug:
	gcc -Wall -o prog -g main.c
clean:
	rm -f prog
