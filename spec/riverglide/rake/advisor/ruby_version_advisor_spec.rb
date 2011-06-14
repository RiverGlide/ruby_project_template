require 'riverglide/rake/advisor/ruby_version_advisor'
module RiverGlide
  module Rake
    module Advisor
      describe RubyVersionExpert do
        include RiverGlide::Rake::Advisor

        context "tells you when the current version and desired version are both exactly '#{RUBY_VERSION}'" do
          it "implicitly comparing them exactly" do
            desired_ruby_version = RUBY_VERSION

            RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_true
          end

          it "explicitly comparing them exactly" do
            desired_ruby_version = RUBY_VERSION

            RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_true
          end
        end

        context "complains when it doesn't understand the version number, for example:" do
          [ "1.9.a",
            "v1.9.2",
            "1.9.2a", 
            "not a version", 
            ".1.9.2", 
            "1.9.2.1" 
          ].each do | unrecognised_version |
            it "it doesn't understand '#{unrecognised_version}'" do
              lambda {RubyVersionExpert.are_we_using?( unrecognised_version )}.should raise_error
            end
          end
        end
        
        context "compares versions taking into account the major, minor and build numbers" do
          [:major, :minor, :build].each do | position |
            context "comparing against the #{position} number exactly" do  
              it "tells you when the ruby version is not exactly right (#{position} too high)" do
                desired_ruby_version = a_version :higher_than, RUBY_VERSION, position

                RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
                RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
              end

              it "tells you when the ruby version is not exactly right (#{position} too low)" do
                desired_ruby_version = a_version :lower_than, RUBY_VERSION, position

                RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
                RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
              end
            end
            
            context "allowing for the current ruby version #{position} number to be the same or higher" do 
              it "tells you when the #{position} of the current version is (the same) or higher" do
                desired_ruby_version = a_version :lower_than, RUBY_VERSION, position
                
                RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
              end

              it "tells you when the #{position} of the current version is the same (or higher)" do
                desired_ruby_version = RUBY_VERSION
                
                RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
              end

              it "tells you when we are not using a ruby version that is (the same) or higher" do
                desired_ruby_version = a_version :higher_than, RUBY_VERSION, position

                RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_false
              end
            end
          end
        end

        def a_version higher_or_lower_than, version_number, major_minor_or_build
          alterations = {:higher_than => :+, :lower_than => :-}
          positions = {:major => 0, :minor => 1, :build => 2 }
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
