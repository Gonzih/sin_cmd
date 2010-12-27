require 'rake'
require 'rake/testtask'

task :default => ['test:units']

desc 'Testing tasks'
namespace :test do
	Rake::TestTask.new :units do |t|
		t.pattern = 'test/*_test.rb'
		t.verbose = true
		t.warning = true
	end
end
