# C Program Template

This is a C program *template* tailored for:

- GCC, GDB, MAKE, VALGRING and DOXYGEN
- VS CODE editor

## Cloning

Check **full example** below. This just explains the steps.

You can *clone* this repository with:

```bash
$> git clone https://github.com/estsetubal-atad/CProgram_Template.git <program-dir-name>
```

where `<program-dir-name>` is the new name of the directory that will be created containing the cloned code. You'll now need to open this directory in *VS Code* as your *working directory*. The easiest way is just to simply:

```bash
$> code <program-dir-name>
```

From *VS Code* you can open an *integrated terminal*: Menu **Terminal > New Terminal**.

### Full example

```bash
$> git clone https://github.com/estsetubal-atad/CProgram_Template.git MyOwnCProgram
$> code MyOwnCProgram
```

## Compiling and executing

Edit the `makefile` to comply with your source files and then, e.g.:

```bash
$> make
```

If you didn't change the name of the *executable* (by default, `prog`), then:

```bash
$> ./prog
```

## Using valgrind

*Valgrind* is very useful to detect "memory leaks" if your program uses *dynamic memory allocation*. You must compile the program with *debug* symbols and then run the executable through `valgrind`:

```bash
$> make debug
$> valgrind --leak-check=full ./prog 
```

**When the program exits** it will present you with memory leak information.

## Debugging

In the **Run** tab (left side) you should see a green play icon ▶️ at the top beside "gdb - Debug project". Click on it and the debug will start. Do not forget to set your *breakpoints*.

## Generating documentation

You'll need `doxygen` installed and follow the doxygen documentation format. A `Doxyfile` is already provided that is suited for the C language. Use:

```bash
$> doxygen Doxyfile
```

and you'll end up with a `html` folder containing the generated documentation.

## Input Library

This template project includes the `input` module. You should use it for *user input* as it provides a relatively robust mechanism to read mixed data and performs validation.

Below is a sample program which exemplifies the usage of this library:

```cpp
#include <stdio.h>
#include <stdlib.h>

#include "input.h"

int main() {

	/* simple data formats with validation examples */
	int value = 0;
	do {
		printf("Integer Value? ");
	} while(!readInteger(&value)); /* loops while invalid */
		
	printf("Integer Value = %d \n", value);

	double value2 = 0;
	do {
		printf("Double Value? ");
	} while(!readDouble(&value2)); /* loops while invalid */
		
	printf("Double Value = %lf \n", value2);

	/* Strings are consumed as-is */
	char text[100];
	printf("Text? ");
	readString(text, 100);
	printf("Text = %s \n", text);

	/* Example of the spliting function; use with CSV files later */
	char line[100] = "Bruno Silva;bruno.silva@estsetubal.ips.pt;;2020/21";

	char** tokens = splitString(line, 4, ";");
	for(int i=0; i<4; i++) {
		printf("Token[%d] = %s \n", i, tokens[i]);
	}

	free(tokens); 

	return 0;
}
```

and an example *user interaction* session:

```markdown
Integer Value? 12d
Integer Value? - 3
Integer Value? -3
Integer Value = -3 
Double Value? 12.4.5
Double Value? -3.14159
Double Value = -3.141590 
Text? This some text and a number 7 
Text = This some text and a number 7 
Token[0] = Bruno Silva 
Token[1] = bruno.silva@estsetubal.ips.pt 
Token[2] =  
Token[3] = 2020/21
```
