def you_need_our_dependency_manager
  begin
    require 'bundler'
    puts "You have our preferred dependency manager. Cool!"
  rescue LoadError => e
    $stderr.puts e.message
    abort "\nOoops! You're not quite ready to start.\n" +
      e.message + "\n\n" +
      "Let's get your environment ready...\n" +
      "\nRun `gem install bundler`\n" + 
      "\nBefore you do that, we recommend that you use rvm and use a fresh gemset.\n" +
      "    rvm:                  http://beginrescueend.com/\n" +
      "    rvm gemsets:          http://beginrescueend.com/gemsets/\n" +
      "    rvm creating gemsets: http://beginrescueend.com/gemsets/creating/\n" +
      "\nOnce you've installed bundler into your nice new gemset, run `rake` again and we'll tell you what's next.\n\n"
  end
end
