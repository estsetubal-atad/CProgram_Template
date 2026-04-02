#!/bin/sh

# Use only in Linux environment and if valgrind is installed and available

make debug
valgrind --leak-check=full --show-reachable=yes --track-origins=yes ./prog
