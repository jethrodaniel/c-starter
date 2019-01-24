# c-starter

This a basic starter template for c code.

## Makefile

```
$ make
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

## Structure

```
$ make tr
tree -a -I 'Unity|.git'
.
├── .gitignore
├── .gitmodules
├── makefile
├── README.md
├── src
│   ├── dig.c
│   ├── dig.h
│   ├── main.c
│   └── main.h
└── test
    └── test_main.c
```
