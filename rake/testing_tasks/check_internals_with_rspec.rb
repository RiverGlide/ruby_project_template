begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  file_pattern = 'spec/**/*_spec.rb'
  tasks = { 
    :spec                  => "-cfd --tag ~wip --tag ~todo",
    :spec_wip              => "-cfd --tag @wip",
    :spec_todo             => "-cfd --tag @todo",
  }

  tasks.each do | task_name, options |
    RSpec::Core::RakeTask.new(task_name) do |spec|
      spec.pattern = FileList[file_pattern]
      spec.rspec_opts = options
    end
  end
rescue LoadError => e
  # Do nothing - bundler will sort this out  
end
