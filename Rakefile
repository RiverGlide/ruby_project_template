puts "\n ** RiverGlide.com - flow without friction **\n"

require 'rubygems'
require './rake/cucumber_tasks'
require './rake/rspec_tasks'

ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

require './rake/required_auditors'
desc "Make sure your environment is ready"
task :environment_ready => [ 
  :you_need_the_right_ruby_version, 
  :you_need_our_dependency_manager, 
  :you_need_to_install_any_dependencies
]

desc "Checks the environment and runs all tests"
task :default => [
  :environment_ready, 
  :spec, 
  :cucumber
]
