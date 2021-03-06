begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  namespace :check do
    thing_we_are_checking = :internals

    file_pattern = 'spec/**/*_spec.rb'

    RSpec::Core::RakeTask.new(thing_we_are_checking) do |spec|
      spec.pattern = FileList[file_pattern]
      spec.rspec_opts = "-cfd --tag ~wip --tag ~todo"
    end

    namespace thing_we_are_checking do
      additional_tasks = { 
        :wip              => "-cfd --tag @wip",
        :todo             => "-cfd --tag @todo",
      }
    
      additional_tasks.each do | task_name, options |
        RSpec::Core::RakeTask.new(task_name) do |spec|
          spec.pattern = FileList[file_pattern]
          spec.rspec_opts = options
        end
      end
    end
  end
rescue LoadError => e
  # Do nothing - bundler will sort this out  
end
