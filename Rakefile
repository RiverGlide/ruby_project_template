puts "\n ** RiverGlide.com - flow without friction **\n"

ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

require './rake/check/environment'
require './rake/check/design'
require './rake/check/features'

desc "Checks the environment and runs all tests"
task :default => [
  'check:environment', 
  'check:design', 
  'check:features'
]
