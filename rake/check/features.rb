begin
  require 'cucumber/rake/task'

  namespace :check do
    thing_we_are_checking = :features

    Cucumber::Rake::Task.new(thing_we_are_checking)

    namespace thing_we_are_checking do
      additional_tasks = {
        :wip  => '-p wip',
        :todo => '-p todo'
      }
      
      additional_tasks.each do | task_name, options |
        Cucumber::Rake::Task.new(task_name, "Run cucumber features with #{options}") do |wip|
            wip.cucumber_opts = options 
        end
      end
    end
  end
rescue LoadError => e
  #do_nothing - bundler will sort this out
end
