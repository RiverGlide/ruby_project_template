begin
  require 'cucumber/rake/task'

  namespace :check do
    Cucumber::Rake::Task.new(:features)

    namespace :features do
      additional_tasks = {
        :wip  => '-p wip',
        :todo => '-p todo'
      }
      
      additional_tasks.each do | task_name, options |
        Cucumber::Rake::Task.new(task_name) do |wip|
            wip.cucumber_opts = options 
        end
      end
    end
  end
rescue LoadError => e
  #do_nothing - bundler will sort this out
end
