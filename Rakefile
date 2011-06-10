puts "\n ** RiverGlide.com - flow without friction **\n\n"

require 'rubygems'
require './rake/cucumber_tasks'

desc "Make sure your environment is ready"
task :environment_ready do
  require './rake/required_auditors'
  your_ruby_version_should_be_greater_than_or_equal_to "1.9.2"
  you_need_our_dependency_manager
  you_need_to_install_any_dependencies
end


desc "Checks the environment and runs all tests"
task :default => [:environment_ready, :cucumber]
