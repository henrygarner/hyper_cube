require 'set'

module HyperCube
  class Set
    
    def initialize(dimensions, tuples)
      @dimensions, @tuples = dimensions, tuples.to_set
    end
    
    def members(dimension)
      @tuples.collect { |tuple| tuple[dimension] }.sort.uniq
    end
    
    def size
      @tuples.size
    end
    
    def dice(dimensions)
      HyperCube::Set.new dimensions, @tuples.collect { |tuple| tuple.with_dimensions(dimensions) }.uniq
    end
    
    def slice(member)
      HyperCube::Set.new @dimensions, @tuples.select { |tuple| tuple.members.include? member }
    end
    
  end
end