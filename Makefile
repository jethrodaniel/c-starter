# This makefile builds and manages the project.

PROGRAM_NAME = main

# Compilation flags
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror

# Test flags
TEST_FLAGS  = -std=c99
TEST_FLAGS += -Wall
TEST_FLAGS += -I./test

# Valgrind flags
VFLAGS  = --quiet
VFLAGS += --tool=memcheck
VFLAGS += --leak-check=full
VFLAGS += --error-exitcode=1

SOURCE := $(shell find ./src -name '*.c' -not -name 'main.c')
MAIN := 'src/main.c'
UNITY := $(shell find ./test/Unity/src -name '*.c')
TESTS := $(shell find ./test -name '*.c' -not -path '*Unity*')

.PHONY: usage
usage:
	@echo "Usage\n"
	@echo "  make COMMAND"
	@echo "\nCOMMANDS\n"
	@echo "  b|uild      Compiles the source code into an executable"
	@echo "  c|lean      Removes generated files that are modified during builds"
	@echo "  r|un        Runs 'build', then runs the resulting executable"
	@echo "  t|est       Runs the tests"
	@echo "  tr|ee       Outputs the project directory using 'tree'"
	@echo "  m|emcheck   Checks for memory leaks"
	@echo

.PHONY: memcheck
memcheck: tests.out
ifeq ( , $(shell which valgrind))
	$(error Please install valgrind to run this command)
else
	@valgrind $(VFLAGS) ./tests.out
	@echo "Memory check passed"
endif
.PHONY: m
m: memcheck

.PHONY: build
build: $(SOURCE)
	@echo "Compiling source code into ./$(PROGRAM_NAME) ..."
	$(CC) $(CC_FLAGS) $(SOURCE) $(MAIN) -o $(PROGRAM_NAME)
.PHONY: b
b: build

.PHONY: clean
clean:
	@echo "Removing all generated files ..."
	rm -rf $(PROGRAM_NAME) *.o *.out *.out.dSYM
.PHONY: c
c: clean

.PHONY: run
run: clean build
	@echo "Running the program ..."
	./$(PROGRAM_NAME)
.PHONY: r
r: run

.PHONY: test
test: tests.out
	@echo "Running the tests ..."
	@./tests.out
PHONY: t
t: test

tests.out: $(TESTS)
	@echo "Compiling tests into ./tests.out"
	@$(CC) $(CFLAGS) $(TESTS) $(SOURCE) $(UNITY) -o tests.out

.PHONY: tree
tree:
ifeq ( , $(shell which tree))
	$(error Please install tree to run this command)
else
	tree -a -I 'Unity|.git'
endif
PHONY: tr
tr: tree
