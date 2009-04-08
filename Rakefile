require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_opts = ['--colour']
  t.spec_files = FileList['spec/*_spec.rb']
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s| 
    s.name = "beardo"
    s.summary = "A command line client for Harvest Co-op"
    s.email = "nick@quaran.to"
    s.homepage = "http://github.com/qrush/beardo"
    s.description = "Communicate with co-workers through the best interface available: your terminal"
    s.authors = ["Nick Quaranto", "Mike Burns"]
    s.add_dependency('adamwiggins-rest-client', '>= 0.9.2')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end


task :default => :spec

