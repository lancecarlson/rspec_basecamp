require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'lib/rspec_basecamp/version'

NAME = "rspec_basecamp"
AUTHOR = "Lance Carlson"
EMAIL = "lancecarlson@gmail.com"
HOMEPAGE = ""
SUMMARY = "Rspec integration with basecamp"
DESCRIPTION = SUMMARY

dist_dirs = [ "lib", "spec" ]

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = RSpecBC::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = SUMMARY
  s.description = DESCRIPTION
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.has_rdoc = true
  
  s.add_dependency('rspec')
  s.add_dependency('rake')
  s.add_dependency('builder')

  s.files = [ "MIT-LICENSE", "Rakefile", "README" ]
  dist_dirs.each do |dir|
    s.files = s.files + Dir.glob("#{dir}/**/*")
  end
  
  s.rubyforge_project = 'rspec_basecamp'
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'RSpec Basecamp Integration'
  rdoc.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.rdoc_files.include('README', 'MIT-LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/rspec_basecamp/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end