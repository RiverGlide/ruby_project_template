require 'rubygems'

puts "\n ** RiverGlide.com - flow without friction **"

def integer_from rational_version_number 
  rational_version_number.delete(".").to_i
end

def current_ruby_version_is desired_ruby_version
  current_version = integer_from( RUBY_VERSION )
  your_version = integer_from desired_ruby_version

  current_version >= your_version
end

desired_ruby_version = "1.9.2"
unless current_ruby_version_is desired_ruby_version
  $stderr.puts "\nOops! You are using ruby #{RUBY_VERSION}. We really want you to use ruby #{desired_ruby_version} or higher.\n" + 
    "Please upgrade to #{desired_ruby_version} or higher.\n" +
    "Suggestion:\n" +
    "  We like using rvm to manage our ruby versions.\n" +
    "  That way, you can just say  `rvm use #{desired_ruby_version}`  and hey presto, you're on version #{desired_ruby_version}\n" +
    "  rvm:  http://beginrescueend.com/\n\n" +
    "Hey, it's up to you, but once you're on ruby #{desired_ruby_version} let us know by running `rake` again.\n\n"
end

puts "You're using ruby #{RUBY_VERSION}. We're happy about that.\n" if current_ruby_version_is desired_ruby_version

puts "That's all folks!\n\n"

task :default
