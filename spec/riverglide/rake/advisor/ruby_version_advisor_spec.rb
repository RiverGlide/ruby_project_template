require 'riverglide/rake/advisor/ruby_version_advisor'
module RiverGlide
  module Rake
    module Advisor
      describe RubyVersionExpert do
        include RiverGlide::Rake::Advisor
        let( :positions ) {{:major => 0, :minor => 1, :build => 2 }}

        it "tells you when the ruby version is exactly right" do
          desired_ruby_version = RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_true
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_true
        end

        it "tells you when the ruby version is not exactly right (too high)" do
          positions.keys.each do |position|
            desired_ruby_version = a_version :higher_than, RUBY_VERSION, position

            RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
            RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
          end
        end

        it "tells you when the ruby version is not exactly right (too low)" do
          desired_ruby_version = a_version :lower_than, RUBY_VERSION, :build

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
        end

        it "tells you when we are using a ruby version that is (the same) or higher" do
          desired_ruby_version = a_version :lower_than, RUBY_VERSION, :build
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        it "tells you when we are using a ruby version that is the same (or higher)" do
          desired_ruby_version = RUBY_VERSION
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        it "tells you when we are not using a ruby version that is (the same) or higher" do
          desired_ruby_version = a_version :higher_than, RUBY_VERSION, :build

          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_false
        end

        it "complains when when it doesn't understand the version number" do
          unrecognised_versions = ["1.9.a", "1.9.2a", "not a version", ".1.9.2", "1.9.2.1"]

          unrecognised_versions.each do | unrecognised_version |
            lambda {RubyVersionExpert.are_we_using?( unrecognised_version )}.should raise_error
          end
        end

        def a_version higher_or_lower_than, version_number, major_minor_or_build
          alterations = {:higher_than => :+, :lower_than => :-}
          altered_by = alterations[higher_or_lower_than]
          position = positions[major_minor_or_build]
          version_numbers = version_number.split( '.' ).collect {|n| n.to_i}
          version_numbers[position] = version_numbers[position].send altered_by, 1
          version_numbers.join '.'
        end
      end
    end
  end
end
