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
	@echo "b|uild      Build the executable"
	@echo "c|lean      Remove any temporary products"
	@echo "cl|obber    Remove any generated files"
	@echo "cu|cumber   Run the feature tests"
	@echo "m|emcheck   Check for memory leaks"
	@echo "r|un        Run 'build', then run the resulting executable"
	@echo "t|est       Run the unit tests"
	@echo "tr|ee       Output the project directory using 'tree'"

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
  mkdir -p build
	$(CC) $(CC_FLAGS) $(SOURCE) $(MAIN) -o ./build/$(PROGRAM_NAME)
.PHONY: b
b: build

.PHONY: clean
clean:
	rm -rf *.o *.out *.out.dSYM tmp*
.PHONY: c
c: clean

.PHONY: clobber
clobber: clean
	rm -rf build/
.PHONY: cl
cl: clobber

.PHONY: run
run: clean build
	./build/$(PROGRAM_NAME)
.PHONY: r
r: run

.PHONY: test
test: build/test
	./build/test
PHONY: t
t: test

build/test: $(TESTS)
	$(CC) $(CFLAGS) $(TESTS) $(SOURCE) $(UNITY) -o build/test

.PHONY: tree
tree:
ifeq ( , $(shell which tree))
	$(error Please install tree to run this command)
else
	tree -a -I 'Unity|.git'
endif
PHONY: tr
tr: tree

# --- >8 ---
.PHONY: cucumber
cucumber: build bundle
	bundle exec cucumber
	rm -rf tmp
.PHONY: cu
cu: cucumber

bundle: gem
	bundle

gem: ruby
ifeq ( , $(shell which bundle))
	gem install bundle
endif

ruby:
ifeq ( , $(shell which ruby))
	$(error Please install Ruby to run the aruba/cucumber tests)
endif

