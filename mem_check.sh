!#/bin/sh

# You must compile the program beforehand with debug symbols:
# $> make debug 

valgrind --leak-check=full --show-reachable=yes --track-origins=yes ./prog
