require 'rubygems'

puts "\n ** RiverGlide.com - flow without friction **"

desired_ruby_version = "1.9.2"
unless RUBY_VERSION.delete('.').to_i >= desired_ruby_version.delete(".").to_i
  $stderr.puts "\nOops! You are using ruby #{RUBY_VERSION}. We really want you to use ruby #{desired_ruby_version} or higher.\n" + 
    "Please upgrade to #{desired_ruby_version} or higher.\n" +
    "Suggestion:\n" +
    "  We like using rvm to manage our ruby versions.\n" +
    "  That way, you can just say  `rvm use #{desired_ruby_version}`  and hey presto, you're on version #{desired_ruby_version}\n" +
    "  rvm:  http://beginrescueend.com/\n\n" +
    "Hey, it's up to you how you do it, but once you're on ruby #{desired_ruby_version} run `rake` again\n\n"
end

puts "\nYou're using ruby #{RUBY_VERSION}. We're happy about that.\n"

puts "\nThat's all folks!\n\n"

task :default
