puts "\n ** RiverGlide.com - flow without friction **\n\n"

require 'rubygems'
require './rake/required_auditors'

your_ruby_version_should_be_greater_than_or_equal_to "1.9.2"
you_need_our_dependency_manager
you_need_to_install_any_dependencies

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber)
Cucumber::Rake::Task.new(:wip) do |wip|
    wip.cucumber_opts = "-p wip"
end

puts "\nTo be continued...\n\n"

task :default => :cucumber
