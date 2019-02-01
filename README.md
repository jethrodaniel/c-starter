# c-starter

This a basic starter template for c code.

## Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/c-starter.git your-project-name

cd your-project-name

./setup
```

It's that easy.

## What it do

It sets you up with:

  - Either a Makefile or a Rakefile with basic project commands
  - Unit tests with [Unity](https://github.com/ThrowTheSwitch/Unity)
  - Memory checking with [valgrind](http://valgrind.org/)
  - Tree output of the project

Additionally, if you choose to use Ruby in your build system:

  - CLI tests (in Gherkin) with [Aruba/Cucumber](https://github.com/cucumber/aruba)


### Ruby Setup

You only need Ruby if you chose it during setup. If you don't have Ruby installed,
[rbenv](https://github.com/rbenv/rbenv) is my recommended way to get Ruby - see
their [install](https://github.com/rbenv/rbenv#installation) section for more info.

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# For bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

# Set up rbenv in your shell
~/.rbenv/bin/rbenv init

# Verify the install
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# Install ruby-build, a rbenv plugin to easily install rubies
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install our version of ruby
rbenv install 2.5.3
```

## TODO

- [ ] Add more example tests
- [ ] Linters for both C and Ruby
- [ ] More detailed README
