require 'set'

module HyperCube
  class Tuple
    
    attr_reader :members
    
    def initialize(members)
      @members = members.to_set
    end
    
    def eql?(other)
      self.hash == other.hash
    end
    
    def hash
      @members.hash
    end
    
    def [](dimension)
      member = @members.detect { |member| member.dimension == dimension }
      member or raise ArgumentError.new('Invalid dimension for tuple')
    end
    
    def with_dimensions(dimensions)
      self.class.new dimensions.collect { |dimension| self[dimension] }
    end
    
    def +(other)
      self.class.new self.members + other.members
    end
    
  end
end