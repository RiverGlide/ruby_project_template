require './rake/audit_tasks/you_need_the_right_ruby_version'
require './rake/audit_tasks/you_need_our_dependency_manager'
require './rake/audit_tasks/you_need_to_install_any_dependencies'

namespace :check do
  desc "Make sure your environment is ready"
  task :environment => [ 
    :you_need_the_right_ruby_version, 
    :you_need_our_dependency_manager, 
    :you_need_to_install_any_dependencies
  ]
end
