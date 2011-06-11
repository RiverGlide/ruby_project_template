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

        it "tells you when the ruby version is not exactly right" do
          desired_ruby_version = higher_than RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
          RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
        end

        it "tells you when we are using a ruby version that is (the same) or higher" do
          desired_ruby_version = lower_than RUBY_VERSION
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        it "tells you when we are not using a ruby version that is (the same) or higher" do
          desired_ruby_version = higher_than RUBY_VERSION

          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_false
        end

        it "tells you when we are using a ruby version that is the same (or higher)" do
          desired_ruby_version = RUBY_VERSION
          
          RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
        end

        def higher_than version
          version_numbers = version.split( '.' ).collect {|n| n.to_i}
          version_numbers[2] = version_numbers[2]+1

          version_numbers.join '.'
        end

        def lower_than version
          version_numbers = version.split( '.' ).collect {|n| n.to_i}
          version_numbers[2] = version_numbers[2]-1

          version_numbers.join '.'
        end
      end
    end
  end
end
