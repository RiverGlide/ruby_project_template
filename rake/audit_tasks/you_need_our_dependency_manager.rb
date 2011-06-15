task :you_need_our_dependency_manager do
  begin
    require 'bundler'
    puts "You have our preferred dependency manager. Cool!"
  rescue LoadError => e
    with_guidance = "
    Let's address this error first:
    
      #{e.message}
    
    We can fix this easily...
    All you should need to do is run:
      
       gem install bundler
    
    Before you do that, we recommend that you use rvm and use a fresh gemset.
        rvm:                  http://beginrescueend.com/
        rvm gemsets:          http://beginrescueend.com/gemsets/
        rvm creating gemsets: http://beginrescueend.com/gemsets/creating/

    Once you've installed bundler into your nice new gemset, run `rake` again and we'll tell you what's next.\n"

    abort with_guidance
  end
end
