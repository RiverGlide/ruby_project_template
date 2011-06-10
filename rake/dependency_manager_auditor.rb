def you_need_our_dependency_manager
  begin
    require 'bundler'
  rescue LoadError => e
    $stderr.puts e.message
    $stderr.puts "\nOoops! You're not quite ready to start. Let's get your environment ready...\n" + 
      "\nRun `gem install bundler`\n" + 
      "\nBefore you do that, we recommend that you use rvm and use a fresh gemset.\n" +
      "    rvm:                  http://beginrescueend.com/\n" +
      "    rvm gemsets:          http://beginrescueend.com/gemsets/\n" +
      "    rvm creating gemsets: http://beginrescueend.com/gemsets/creating/\n" +
      "\nOnce you've installed bundler into your nice new gemset, run `rake` again and we'll tell you what's next.\n\n"
  end
end
