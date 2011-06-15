require 'versionary/version_number'
module Versionary
  describe VersionNumber, :template_project => true  do
    include Versionary

    context "when the versions are the same" do
      it "tells you they are equal" do
        VersionNumber.of( RUBY_VERSION ).should == VersionNumber.of( RUBY_VERSION )
      end

      it "tells you that the first number is not less than second number" do
        VersionNumber.of( RUBY_VERSION ).should_not < VersionNumber.of( RUBY_VERSION )
      end

      it "tells you that the first number is not greater than second number" do
        VersionNumber.of( RUBY_VERSION ).should_not > VersionNumber.of( RUBY_VERSION )
      end
    end

    [:major, :minor, :build].each do | position |
      context "when the #{position} number is different" do
        context "making the first version lower than the second version" do
          let(:first_version) {'0.0.9'}
          let(:second_version) { a_version :higher_than, first_version, position }

          it "tells you that the first number is less than the second number" do
            VersionNumber.of( first_version ).should < VersionNumber.of( second_version )
          end

          it "tells you that the first number is not greater than the second number" do
            VersionNumber.of( first_version ).should_not > VersionNumber.of( second_version )
          end

          it "tells you that they're not equal" do
            VersionNumber.of( first_version ).should_not == VersionNumber.of( second_version )
          end
        end
        
        context "making the first version higher than the second version" do
          let(:first_version) {'10.10.10'} # to ensure that digits are compared numerically, not alphabetically
          let(:second_version) { a_version :lower_than, first_version, position }

          it "tells you that the first number is greater than the second number" do
            VersionNumber.of( first_version ).should > VersionNumber.of( second_version )
          end

          it "tells you that the first number is not less than the second number" do
            VersionNumber.of( first_version ).should_not < VersionNumber.of( second_version )
          end

          it "tells you that they're not equal" do
            VersionNumber.of( first_version ).should_not == VersionNumber.of( second_version )
          end
        end
      end
    end

    context "when the latter number is a string" do
      it "tells you when they're equal as version numbers" do
        VersionNumber.of('1.9.2').should == '1.9.2'
      end

      it "tells you when the first version number is greater than a string representation" do
        VersionNumber.of('1.9.10').should > '1.9.9'
      end
      it "tells you when the first version number is less than a string representation" do 
        VersionNumber.of('1.9.9').should < '1.9.10'
      end

      it "tells you when the number is not equal to the string representation" do
        VersionNumber.of('1.9.9').should_not == '1.9.10'
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
          lambda {VersionNumber.of( unrecognised_version )}.should raise_error NotAVersionComplaint
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
