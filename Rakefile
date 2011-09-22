puts "\n ** RiverGlide.com - flow without friction **\n"

ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

require './rake/audit_environment'
require './rake/testing_tasks/check_internals_with_rspec'
require './rake/testing_tasks/check_features_with_cucumber'

desc "Checks the environment and runs all tests"
task :default => [
  'check:environment', 
  'check:design', 
  'check:features'
]
