begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  file_pattern = 'spec/**/*_spec.rb'
  tasks = { 
    :design                  => "-cfd --tag ~wip --tag ~todo",
    :design_wip              => "-cfd --tag @wip",
    :design_todo             => "-cfd --tag @todo",
  }
  
  namespace :check do
    tasks.each do | task_name, options |
      RSpec::Core::RakeTask.new(task_name) do |spec|
        spec.pattern = FileList[file_pattern]
        spec.rspec_opts = options
      end
    end
  end
rescue LoadError => e
  # Do nothing - bundler will sort this out  
end
