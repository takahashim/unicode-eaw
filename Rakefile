require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :generate do
  sh "ruby tools/generate.rb > lib/unicode/eaw/data.rb"
end
