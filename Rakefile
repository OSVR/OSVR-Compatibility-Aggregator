require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new :spec

# Just the offline specs.
RSpec::Core::RakeTask.new(:offline_spec) do |task|
  task.exclude_pattern = 'spec/**{,/*/**}/online_*_spec.rb'
end

task default: :spec
