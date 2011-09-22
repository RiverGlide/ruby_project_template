puts "\n ** RiverGlide.com - flow without friction **\n"

ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

require './rake/check/environment'
require './rake/check/internals'
require './rake/check/features'

namespace :check do
  desc "Check everything (except todo and wip stuff)"
  task :everything => [
    'check:environment', 
    'check:internals', 
    'check:features'
  ]
end

default = 'check:everything'
desc "Runs the #{default} task"
task :default => [ default ]
