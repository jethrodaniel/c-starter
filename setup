#!/bin/bash

this_dir=$(dirname $(readlink -f $0))
# source "${this_dir}/helpers.sh"

# Asks a yes or no question, defaulting to no
#
# $1 - the question to ask (no need for a `?`)
ask() {
  local choice=''
  echo "${cyan}$1${reset}?"
  echo "  default is no"
  read -p '  (y/n): ' choice
  [[ $choice =~ ^[yY][eE][sS]|[yY]$ ]]
}

# Uses sed to find and replace text in the given file
#
# $1 - the text to replace
# $2 - the text to replace with
# $3 - the file
replace_in_file() {
  # sed works differently on OS X
  if [[ "$(uname -a)" = *"Darwin"* ]] ; then
    sed -i '' "s/$1/$2/g" "$PWD/$3"
  else
    sed -i "s/$1/$2/g" "$PWD/$3"
  fi
}

# Uses sed to delete all lines in a file after a match
#
# $1 - the text to match (will be removed)
# $2 - the file
delete_after_match() {
  sed -i "/^$1$/Q" "$PWD/$2"
}

# Uses sed to delete all lines in a file that match the expression
#
# $1 - the text to match (will be removed)
# $2 - the file
delete_matching() {
  sed -i "/$1/d" "$PWD/$2"
}

echo 'Setting up a basic c project structure ...'
echo
echo 'We start with the following layout:'
echo
echo '├── .gitignore'
echo '├── .gitmodules'
echo '├── LICENSE'
echo '├── README.md'
echo '├── setup.sh'
echo '├── src'
echo '└── test'
echo

echo 'What would you like your inital c file to be named? '
echo
read -p "(can't be main, 3 char min): " choice
echo

until [[ $choice =~ ^[a-Z]{3}[a-Z]*$ ]] && [[ $choice != 'main' ]]; do
  echo
  echo "  ❌invalid choice (can't be main, min 3 chars)"
  unset choice
  echo
  read -p 'initial name: ' choice
  echo
done

mv src/__program__.c "src/$choice.c"
mv src/__program__.h "src/$choice.h"
mv "test/test___program__.c" "test/test_$choice.c"

replace_in_file "__program__" "$choice" "src/$choice.c"
replace_in_file "__program__" "$choice" "src/$choice.h"
replace_in_file "__program__" "$choice" "src/main.c"
replace_in_file "__program__" "$choice" "src/main.h"
replace_in_file "__program__" "$choice" "test/test_$choice.c"
replace_in_file "__program__" "$choice" "features/$choice.feature"

echo 'Created the following source and test files:'
echo
echo '├── src'
echo "│   ├── $choice.c"
echo "│   ├── $choice.h"
echo "│   ├── main.c"
echo "│   └── main.h"
echo '├── test'
echo "│   └── test_$choice.c"
echo '└── tests.out'
echo

using_ruby=false

if ask 'Do you want a Ruby-based build system'; then
  using_ruby=true
  echo
  echo 'Yay, Ruby! 💎 You additionally get the following:'
  echo
  echo '  ├── features'
  echo '  │   ├── main.feature'
  echo '  │   └── support'
  echo '  │       ├── aruba.rb'
  echo '  │       └── env.rb'
  echo '  ├── Gemfile'
  echo '  ├── Gemfile.lock'
  echo '  ├── Rakefile'
  echo '  └── .ruby-version'
  echo
else
  rm -rf features Gemfile Gemfile.lock .ruby-version .rubocop.yml
  echo
  echo "You have a basic GNU Make setup, so here's your makefile:"
  echo
  echo '  ↳ Makefile'
  echo
  delete_after_match '# --- >8 ---' "Makefile"
  delete_matching 'cu|cumber' "Makefile"
fi
echo

echo "You're good to go - now off to the code mines!"
echo

if [ "$using_ruby" = true ]; then
  echo 'To get help, call `rake`'
else
  echo 'To get help, call `make`'
fi
