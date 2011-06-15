# Ruby Template Project with CukeSalad

Starting a new ruby project? Fed up of [yak-shaving](http://www.urbandictionary.com/define.php?term=yak%20shaving)?

This template project guides you through setting up your environment 
and has all the built in rake tasks for checking your environment and running
rspec and cucumber tests.

This project assumes that you'll be using [cukesalad](http://cukesalad.info)
but you don't have to. Just remove cukesalad from the Gemfile and delete the `features/support/env.rb`.
You can then use cucumber as normal.

Clone it - Customise it - Go!

## How to use it

Clone this project as normal.

    git clone git://github.com/RiverGlide/ruby_project_template.git your_project_name

Then change directory into `your_project_name` and remove the _origin_  remote:

    git remote rm origin

Add your own remote if you have one:

    git remote add origin <git link to your project>

Check the Rakefile and set your minimum ruby version number, e.g.:
   
    ENV[ 'MINIMUM_RUBY_VERSION' ] = '1.9.2'

Then, just type `rake` and you'll be told what to do next.

You're ready to go once you see something like this:

    ** RiverGlide.com - flow without friction **
    You're using ruby 1.9.2. We're happy about that.
    You have our preferred dependency manager. Cool!
    You have all the dependencies you need!!
    
    No examples matching  could be found
    ~/.rvm/rubies/ruby-1.9.2-p180/bin/ruby -S bundle exec cucumber 
    Using the default profile...
    0 scenarios
    0 steps
    0m0.000s

Edit the `README.md` file and make your first commit to start your new project.

Feel free to edit the `Rakefile` and move things around all you like. Just type `rake -T` for a list of available tasks.

Then you can go straight to `features/a_place_to_start.feature` and start specifying your first feature. It's already tagged as work-in-progress.

    rake features_wip

Remember, check the .gitignore file to make sure it ignores the things you want it to ignore.

Enjoy!!
