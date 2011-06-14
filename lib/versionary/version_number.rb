module Versionary
  class VersionNumber

    include Comparable

    def self.of version
      self.new version
    end

    def initialize version
      raise NotAVersionComplaint.about version if not a_recognised? version
      @version = version
    end

    def <=> other_version
      @version.to_s <=> other_version.to_s
    end

    def to_s
      @version
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
