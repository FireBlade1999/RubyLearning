
#
# This is a software task management file. It allows you to 
# specify tasks and describe dependencies as well as group
# tasks in a namespace. Similar to Make, similar to a POM
#
# When any of the requires fail, check > gem which [required] to see if
# it is indeed installed. If it isn't, > gem install [required]
#

require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/testtask'
require 'rspec/core/rake_task'

spec = Gem::Specification.new do |s|
  s.name = 'RubyWebDriverSample1'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README', 'LICENSE']
  s.summary = 'This has grown beyond the WebDriver Sample. It\'s now a general Ruby Samples project'
  s.description = s.summary
  s.author = 'Steven Williams'
  s.email = 'steven.williams@bjss.com'
  # s.executables = ['your_executable_here']
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
  s.add_development_dependency 'rspec', '~>2.0'
end

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

Rake::RDocTask.new do |rdoc|
  files =['README', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README" # page to start on
  rdoc.title = "RubyWebDriverSample1 Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
  t.verbose = true
end

RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/erector/*_spec.rb'
  spec.rspec_opts = [Dir["lib"].to_a.join(':')]
end
