task :you_need_to_install_any_dependencies do
  begin
    Bundler.setup(:default, :development)
    puts "You have all the dependencies you need!!\n\n"
  rescue Bundler::BundlerError => e
    with_guidance = "Oops! So near, yet so far.
      #{e.message}

    Run `bundle install` and all the dependencies you need will be installed\n\n"

    abort with_guidance
  end
end
