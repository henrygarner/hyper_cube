module HyperCube
  class Member
    
    attr_reader :dimension, :value
    
    def initialize(dimension, value)
      @dimension, @value = dimension, value
    end
    
    def <=>(other)
      dimension.sort_by.call(self, other)
    end
    
    def to_tuple
      HyperCube::Tuple.new [self]
    end
    
    def +(other)
       HyperCube::Tuple.new [self, other]
    end
    
  end
end
