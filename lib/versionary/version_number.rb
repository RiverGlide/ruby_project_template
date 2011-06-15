module Versionary
  class VersionNumber

    include Comparable

    attr_reader :major, :minor, :build

    def self.of version
      self.new version
    end

    def initialize version
      raise NotAVersionComplaint.about version if not a_recognised? version
      numbers = version.split( '.' ).collect { |n| n.to_i }
      @major = numbers[0]
      @minor = numbers[1]
      @build = numbers[2]
    end

    def <=> other_version
      other_version = VersionNumber.of(other_version) if other_version.class == String
      diff = []
      diff[0] = self.major <=> other_version.major
      diff[1] = self.minor <=> other_version.minor
      diff[2] = self.build <=> other_version.build
      diff.each do |v|
        return v if v != 0
      end
      0
    end

    def to_s
      "#{@major}.#{@minor}.#{@build}" 
    end

    private
    def a_recognised? version
      version =~ /^\d+\.\d+\.\d+$/
    end
  end

  class NotAVersionComplaint < Exception
    def self.about version
      self.new version
    end
    
    def initialize version
      super "#{version} is not a recognised version number"
    end
  end
end
