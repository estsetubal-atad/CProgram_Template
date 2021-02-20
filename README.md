# C Program Template

This is a C program *template* tailored for:

- GCC, GDB, MAKE, VALGRING and DOXYGEN
- VS CODE editor

## Cloning

You can *clone* this repository with:

```bash
$> git clone <repo-url> <program-dir-name>
```

where `<program-dir-name>` is the new name of the directory that will be created containing the cloned code. You'll now need to open this directory in *VS Code* as your *working directory*. The easiest way is just to simply:

```bash
$> code <program-dir-name>
```

From *VS Code* you can open an *integrated terminal*: Menu **Terminal > New Terminal**.

### Full example

```bash
$> git clone <repo-url> MyOwnCProgram
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

A VS Code `launch.json` is already provided.

## Generating documentation

You'll need `doxygen` installed and follow the doxygen documentation format. A `Doxyfile` is already provided that is suited for the C language. Use:

```bash
$> doxygen Doxyfile
```

and you'll end up with a `html` folder containing the generated documentation.
