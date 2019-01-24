# c-starter

This a basic starter template for c code.

## Includes

  - `Makefile` - to manage the project
  - `README.md` - this README
  - `test/` - the test directory
    - `test/Unity` - the testing framework
  - `src/` - the source directory
    - `src/main.c` - Sample main
    - `src/main.h` - Sample main header

## Makefile commands

```
Usage

  make COMMAND

COMMANDS

  b|uild      Compiles the source code into an executable
  c|lean      Removes generated files that are modified during builds
  r|un        Runs 'build', then runs the resulting executable
  t|est       Runs the tests
  tr|ee       Outputs the project directory using 'tree'
  m|emcheck   Checks for memory leaks
```
