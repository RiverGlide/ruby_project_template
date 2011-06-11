module RiverGlide
  module Rake
    module Advisor
      class RubyVersionExpert
        def self.we_insist_upon desired_ruby_version
          RUBY_VERSION == desired_ruby_version
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

          RubyVersionExpert.we_insist_upon( desired_ruby_version ).should be_true
        end

        it "tells you when the ruby version is wrong" do
          desired_ruby_version = higher_than RUBY_VERSION

          RubyVersionExpert.we_insist_upon( desired_ruby_version ).should be_false
        end

        def higher_than version
          version_numbers = version.split( '.' ).collect {|n| n.to_i}
          version_numbers[2] = version_numbers[2]+1

          version_numbers.join '.'
        end
      end
    end
  end
end
