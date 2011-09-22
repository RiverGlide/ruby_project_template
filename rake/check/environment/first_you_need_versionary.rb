task :first_you_need_versionary do
  begin 
    require 'versionary/version_number'
  rescue LoadError
    puts "
    To continue, you need a tiny little gem called versionary:

      gem install versionary
    
    Once that's installed, type `rake` and we'll tell you what to do next\n\n"
  end
end

