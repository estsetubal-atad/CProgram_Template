# Select environment: 'linux' (default) or 'windows'
ENV ?= linux

# Common flags
FLAGS = -Wall -Wextra

# Environment-specific configuration
ifeq ($(ENV),linux)
    CC = gcc
    EXECUTABLE = prog
    RM = rm -f
    DEBUG_FLAGS = -g
endif

ifeq ($(ENV),windows)
    CC = gcc
    EXECUTABLE = prog.exe
    RM = del
    DEBUG_FLAGS = -g -gdwarf-2
endif

# Safety check
ifeq ($(filter $(ENV),linux windows),)
    $(error Unknown ENV '$(ENV)'. Use ENV=linux or ENV=windows)
endif

# Targets
default:
	$(CC) $(FLAGS) -o $(EXECUTABLE) main.c input.c

debug:
	$(CC) $(FLAGS) $(DEBUG_FLAGS) -o $(EXECUTABLE) main.c input.c

clean:
	$(RM) $(EXECUTABLE)
