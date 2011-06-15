begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  file_pattern = 'spec/**/*_spec.rb'
  tasks = { 
    :spec                  => "-cfd --tag ~wip --tag ~todo --tag ~@template_project",
    :spec_wip              => "-cfd --tag @wip",
    :spec_todo             => "-cfd --tag @todo",
    :spec_template_project => "-cfd --tag @template_project"
  }

  tasks.each do | task_name, options |
    RSpec::Core::RakeTask.new(task_name) do |spec|
      spec.pattern = FileList[file_pattern]
      spec.rspec_opts = options
    end
  end

  RSpec::Core::RakeTask.new(:spec_template_project) do |spec|
    spec.pattern = FileList['rake/versionary/spec/**/*_spec.rb']
    spec.rspec_opts = tasks[:spec_template_project]
  end
rescue LoadError => e
  #do_nothing - bundler will sort this out
end
