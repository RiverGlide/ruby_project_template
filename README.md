# Ruby Template Project with CukeSalad

Starting a new ruby project? Fed up of [yak-shaving](http://www.urbandictionary.com/define.php?term=yak%20shaving)?

## Getting Started
Clone this project as normal. If you don't want this project's history so you can start afresh, use the following command:

    git clone --depth 1 git://github.com/RiverGlide/ruby_project_template.git

Rename the `ruby_project_template` to a name more meaningful to your project.

Then change directory into that folder and remove the _origin_  remote:

    git remote rm origin

Then add a remote to your project:

    git remote add origin <git link to your project>

Check the Rakefile and set your minimum ruby version number, e.g.:
   
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

Edit the `README.md` file and make your first commit to start your new project.

Feel free to edit the `Rakefile` and move things around all you like. Just type `rake -T` for a list of available tasks.

Then you can go straight to `features/a_place_to_start.feature` and start specifying your first feature. It's already tagged as work-in-progress.

    rake features_wip

Enjoy!!
