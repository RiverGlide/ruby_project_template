require 'riverglide/rake/advisor/ruby_version_advisor'
module RiverGlide
  module Rake
    module Advisor
      describe RubyVersionExpert do
        include RiverGlide::Rake::Advisor

        context "when the current version and desired version are both exactly '#{RUBY_VERSION}':" do
          let( :desired_ruby_version ) { RUBY_VERSION }

          it "assumes you want to know when they're exactly the same" do
            RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_true
          end

          it "tells you when the current version is exactly the same" do
            RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_true
          end

          it "tells you when the current version is the same (or higher)" do
            RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
          end
        end

        context "when major, minor or build numbers vary" do
          [:major, :minor, :build].each do | position |
            context "and current ruby version is lower than the specified version (#{position} variation)" do
              let( :desired_ruby_version ) { a_version :higher_than, RUBY_VERSION, position}
            
              it "assumes you want to know when they are not exactly the same (#{position} too low)" do
                RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
              end

              it "tells you when the ruby version is not exactly the same (#{position} too low)" do
                RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
              end

              it "tells you when the ruby version is not (the same) or higher" do
                RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_false
              end
            end
            
            context "and current version is higher than the desired ruby version (#{position} variation)" do 
              let( :desired_ruby_version ) { a_version :lower_than, RUBY_VERSION, position }

              it "assumes you want to know when they are not exactly the same (#{position} too high)" do
                RubyVersionExpert.are_we_using?( desired_ruby_version ).should be_false
              end

              it "tells you when the ruby version is not exactly the same (#{position} too high)" do
                RubyVersionExpert.are_we_using?( desired_ruby_version, :exactly ).should be_false
              end

              it "tells you when the ruby version is acceptably higher" do
                RubyVersionExpert.are_we_using?( desired_ruby_version, :or_higher ).should be_true
              end
            end
          end
        end

        context "when the version number provided is not understood, for example:" do
          [ "1.9.a",
            "v1.9.2",
            "1.9.2a", 
            "not a version", 
            ".1.9.2", 
            "1.9.2.1" 
          ].each do | unrecognised_version |
            it "can't understand '#{unrecognised_version}'" do
              lambda {RubyVersionExpert.are_we_using?( unrecognised_version )}.should raise_error
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
