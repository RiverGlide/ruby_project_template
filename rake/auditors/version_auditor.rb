$: << File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", "lib")
def your_ruby_version_should_be_greater_than_or_equal_to desired_ruby_version
  require 'riverglide/rake/advisor/ruby_version_advisor'
  unless RiverGlide::Rake::Advisor::RubyVersionExpert.are_we_using? desired_ruby_version, :or_higher
     abort "Oops! You are using ruby #{RUBY_VERSION}. We really want you to use ruby #{desired_ruby_version} or higher.\n" + 
      "Please upgrade to #{desired_ruby_version} or higher.\n" +
      "Suggestion:\n" +
      "  We like using rvm to manage our ruby versions.\n" +
      "  That way, you can just say  `rvm use #{desired_ruby_version}`  and hey presto, you're on version #{desired_ruby_version}\n" +
      "  rvm:  http://beginrescueend.com/\n\n" +
      "Hey, it's up to you, but once you're on ruby #{desired_ruby_version} let us know by running `rake` again.\n\n"
  end
  puts "You're using ruby #{RUBY_VERSION}. We're happy about that."
end
