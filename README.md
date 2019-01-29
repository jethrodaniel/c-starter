# c-starter

This a basic starter template for c code.

It sets up the project with a Makefile, a sensible directory structure, and tests.

While unit tests are in C via [Unity](https://github.com/ThrowTheSwitch/Unity),
the CLI tests (in Gherkin) via [Aruba/Cucumber](https://github.com/cucumber/aruba)
require [Ruby](https://www.ruby-lang.org/en/).

If you'd prefer to **not** have any Ruby code in your project, or just lack the
need for CLI testing, check out the `c-only` branch.

## Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/c-starter.git your-project-name
```

## Makefile

```
$ make
  make COMMAND

COMMANDS

  b|uild      Compiles the source code into an executable
  cl|ean      Removes generated files that are modified during builds
  c|ucumber   Runs the aruba/cucumber tests
  p|urge      Alias to 'clean'
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
├── features
│   ├── main.feature
│   └── support
│       ├── aruba.rb
│       └── env.rb
├── Gemfile
├── Gemfile.lock
├── .gitignore
├── .gitmodules
├── makefile
├── README.md
├── .ruby-version
├── src
│   ├── dig.c
│   ├── dig.h
│   ├── main.c
│   └── main.h
└── test
    └── test_dig.c

    4 directories, 15 files
```

## Tests

Two kinds of tests are used:
  - Unit tests (in C) with [Unity](https://github.com/ThrowTheSwitch/Unity)
  - CLI tests (in Gherkin) with [Aruba/Cucumber](https://github.com/cucumber/aruba)
    - Requires [ruby](https://www.ruby-lang.org/en/)
    - Aruba [documentation](https://app.cucumber.pro/projects/aruba/documents/branch/master/)

## TODO

- [ ] Automate renaming `dig.{c,h}` with a setup script
- [ ] Add more example tests
