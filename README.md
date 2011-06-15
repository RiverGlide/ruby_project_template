# Ruby Template Project with CukeSalad

Starting a new ruby project? Fed up of [yak-shaving](http://www.urbandictionary.com/define.php?term=yak%20shaving)?

Clone this project, then remove the remote:

    git remote rm origin

Then add a remote to your project:

    git remote add origin <git link to your project>

Check the Rakefile and set your minimum ruby version number
   
    ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

Then, just type `rake` and you'll be told what to do next.

You're ready to go once you see:

    ** RiverGlide.com - flow without friction **
    You're using ruby 1.9.2. We're happy about that.
    You have our preferred dependency manager. Cool!
    You have all the dependencies you need!!
    ~/.rvm/rubies/ruby-1.9.2-p180/bin/ruby -S bundle exec rspec -cfd --tag ~wip --tag ~todo --tag ~@template_project spec/versionary/version_number_spec.rb
    No examples were matched. Perhaps {:wip=>true, :todo=>true, :template_project=>true} is excluding everything?

    Finished in 0.00003 seconds
    0 examples, 0 failures
    ~/.rvm/rubies/ruby-1.9.2-p180/bin/ruby -S bundle exec cucumber 
    Using the default profile...
    0 scenarios
    0 steps
    0m0.000s

Then you can go straight to `features/a_place_to_start.feature` and start specifying your first feature.
