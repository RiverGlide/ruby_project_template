task :you_need_our_dependency_manager do
  begin
    require 'bundler'
    puts "You have our preferred dependency manager. Cool!"
  rescue LoadError => e
    abort "\nOoops! You're not quite ready to start.\n" +
      e.message + "\n\n" +
      "We can fix this easily...\n" +
      "\nAll you should need to do is run `gem install bundler`\n" + 
      "\nBefore you do that, we recommend that you use rvm and use a fresh gemset.\n" +
      "    rvm:                  http://beginrescueend.com/\n" +
      "    rvm gemsets:          http://beginrescueend.com/gemsets/\n" +
      "    rvm creating gemsets: http://beginrescueend.com/gemsets/creating/\n" +
      "\nOnce you've installed bundler into your nice new gemset, run `rake` again and we'll tell you what's next.\n\n"
  end
end
