require 'rake/clean'

CLEAN.include 'tmp/', '*/**.o'
CLOBBER << 'build/'

main = 'src/main.c'
src_files = Rake::FileList['src/*.c'].exclude main
obj_files = src_files.ext '.o'
test_files = Rake::FileList['test/*.c'].exclude 'test/Unity'
UNITY = 'test/Unity/src/unity.c'

BUILD_FLAGS = '-std=c99 -g -Wall -Wextra -pedantic -Werror'
TEST_FLAGS  = '-std=c99 -Wall'
MEM_FLAGS   = '--quiet --tool=memcheck --leak-check=full --error-exitcode=1'

task :default do
  sh 'rake -T', :verbose => false
end

desc 'Builds and runs the executable'
task :run => %i[build] do
  sh 'build/main'
end

desc 'Builds the executable'
task :build => ['build/main', :clean]

# Compile the executable into `build/`
file 'build/main' => obj_files do |task|
  sh "gcc #{obj_files.sub('src', 'build')} #{main} -o #{task.name.sub('src', 'build')}"
end

# Create object files in `build/` from source files in `src`
rule '.o' => '.c' do |task|
  mkdir_p 'build'
  sh "gcc #{BUILD_FLAGS} -c #{task.source} -o #{task.name.sub('src', 'build')}"
end

desc 'Runs the feature tests'
task :cucumber => %i[build] do
  sh 'cucumber'
  sh 'rake clean', :verbose => false
end

desc 'Runs the unit tests'
task :test => [:build, 'build/test'] do
  sh 'build/test'
end

# Creates the test executable in `build`
file 'build/test' do |task|
  sh "gcc #{TEST_FLAGS} #{test_files} #{src_files} #{UNITY} -o build/test"
end

desc 'Checks for memory leaks'
task :memcheck => ['build/test', :clean] do
  abort 'You need valgrind to run the memory check!' if %x[which valgrind] == ''

  sh "valgrind #{MEM_FLAGS} build/test"
end
