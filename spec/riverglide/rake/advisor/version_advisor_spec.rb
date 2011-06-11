module RiverGlide
  module Rake
    module Advisor
      class RubyVersionExpert
        def self.are_we_using desired_ruby_version, compared=:exactly
          return RUBY_VERSION == desired_ruby_version if compared == :exactly
          desired_version = desired_ruby_version.split('.').collect { |n| n.to_i }
          if compared == :or_higher
            current_version = RUBY_VERSION.split('.').collect { |n| n.to_i }
            same_or_higher = []
            (0..2).each do |i|
              same_or_higher[i] = current_version[i] >= current_version[i]
            end
            same_or_higher.all?
          end
        end
      end
    end
  end
end

module RiverGlide
  module Rake
    module Advisor
      describe RubyVersionExpert do
        include RiverGlide::Rake::Advisor
        
        it "tells you when the ruby version is just right" do
          desired_ruby_version = RUBY_VERSION

          RubyVersionExpert.are_we_using( desired_ruby_version ).should be_true
        end

        it "tells you when the ruby version is wrong" do
          desired_ruby_version = higher_than RUBY_VERSION

          RubyVersionExpert.are_we_using( desired_ruby_version ).should be_false
        end

        it "tells you when the ruby version is the same or higher" do
          desired_ruby_version = lower_than RUBY_VERSION
          
          RubyVersionExpert.are_we_using( desired_ruby_version, :or_higher ).should be_true
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
