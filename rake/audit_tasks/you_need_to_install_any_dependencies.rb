task :you_need_to_install_any_dependencies do
  begin
    Bundler.setup(:default, :development)
    puts "You have all the dependencies you need!!\n\n"
  rescue Bundler::BundlerError => e
    $stderr.puts "Oops! So near, yet so far.\n\n"
    $stderr.puts e.message + "\n\n"
    $stderr.puts "Run `bundle install` and all the dependencies you need will be installed\n\n"
    exit e.status_code
  end
end
