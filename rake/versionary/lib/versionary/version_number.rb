module Versionary
  class VersionNumber

    include Comparable

    attr_reader :major, :minor, :build

    VERSION_PATTERN = /^\d+\.\d+\.\d+$/

    def self.of version
      self.new version
    end

    def initialize version
      raise NotAVersionComplaint.about version if not a_recognised? version
      number = infer_from version
      @major = value_of :major, number
      @minor = value_of :minor, number
      @build = value_of :build, number
    end

    def <=> other_version
      with_other_version = VersionNumber.of(other_version) if other_version.class == String
      with_other_version = other_version if other_version.class == self.class
      
      compare(self, with_other_version)
    end

    def to_s
      "#{@major}.#{@minor}.#{@build}" 
    end

    private
    def a_recognised? version
      version =~ VERSION_PATTERN
    end

    def infer_from version
      version.split( '.' ).collect { |n| n.to_i }
    end

    def value_of position, from_numbers
      positions = {:major => 0, :minor => 1, :build => 2}
      from_numbers[positions[position]]
    end

    def compare first_version, second_version
      differences = []
      differences[0] = first_version.major <=> second_version.major
      differences[1] = first_version.minor <=> second_version.minor
      differences[2] = first_version.build <=> second_version.build
      differences.each do |indication|
        return indication if it_is_a_greater_than_or_less_than? indication
      end
      0
    end

    def it_is_a_greater_than_or_less_than? indication
      indication != 0
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
