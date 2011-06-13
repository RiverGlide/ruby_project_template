require 'riverglide/rake/advisor/ruby_version_advisor'
module RiverGlide
  module Rake
    module Advisor
      describe RubyVersionExpert do
        include RiverGlide::Rake::Advisor
        
        it "tells you when the ruby version is exactly right" do
          desired_ruby_version = RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_true
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_true
        end

        it "tells you when the ruby version is not exactly right (too high)" do
          desired_ruby_version = version :higher_than, RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
        end

        it "tells you when the ruby version is not exactly right (too low)" do
          desired_ruby_version = version :lower_than, RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
        end

        it "tells you when we are using a ruby version that is (the same) or higher" do
          desired_ruby_version = version :lower_than, RUBY_VERSION
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        it "tells you when we are not using a ruby version that is (the same) or higher" do
          desired_ruby_version = version :higher_than, RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_false
        end

        it "tells you when we are using a ruby version that is the same (or higher)" do
          desired_ruby_version = RUBY_VERSION
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        it "complains when when it doesn't recognise the version number" do
          unrecognised_versions = ["1.9.a", "1.9.2a", "not a version", ".1.9.2", "1.9.2.1"]

          unrecognised_versions.each do | text |
            lambda {RubyVersionExpert.are_we_using?( text )}.should raise_error
          end
        end

        def version higher_or_lower_than, version_number
          relation = {:higher_than => :+, :lower_than => :-}
          version_numbers = version_number.split( '.' ).collect {|n| n.to_i}
          version_numbers[2] = version_numbers[2].send relation[higher_or_lower_than], 1
          version_numbers.join '.'
        end
      end
    end
  end
end
