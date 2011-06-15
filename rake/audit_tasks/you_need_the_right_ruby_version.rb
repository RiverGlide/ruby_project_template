task :you_need_the_right_ruby_version => :you_need_versionary do
  include Versionary

  minimum_ruby_version = ENV[ 'MINIMUM_RUBY_VERSION' ]
  
  with_guidance = "
  Oops! You are using ruby #{RUBY_VERSION}. We really want you to use ruby #{minimum_ruby_version} or higher
    Suggestion:
      We like using rvm to manage our ruby versions.
      That way, you can just say  `rvm use #{minimum_ruby_version}`  and hey presto, you're on version #{minimum_ruby_version}
      rvm:  http://beginrescueend.com/
  Hey, it's up to you, but once you're on ruby #{minimum_ruby_version} let us know by running `rake` again.\n\n"

  abort with_guidance if VersionNumber.of( RUBY_VERSION ) < minimum_ruby_version
  
  puts "You're using ruby #{RUBY_VERSION}. We're happy about that."
end

task :you_need_versionary do
  begin 
    require 'versionary/version_number'
  rescue LoadError
    puts "
    To continue, you need a tiny little gem called versionary:

      gem install versionary
    
    Once that's installed, type `rake` and we'll tell you what to do next\n\n"
  end
end

