begin
  require 'cucumber/rake/task'

  namespace :check do
    Cucumber::Rake::Task.new(:features)
    
    additional_tasks = {
      :features_wip  => '-p wip',
      :features_todo => '-p todo'
    }
    
    additional_tasks.each do | task_name, options |
      Cucumber::Rake::Task.new(task_name) do |wip|
          wip.cucumber_opts = options 
      end
    end
  end
rescue LoadError => e
  #do_nothing - bundler will sort this out
end
