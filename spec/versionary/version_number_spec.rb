require 'versionary/version_number'
module Versionary
  describe VersionNumber do
    include Versionary

    it "tells you if two version numbers are the same" do
      VersionNumber.of( RUBY_VERSION ).should == VersionNumber.of( RUBY_VERSION )
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
  end
end