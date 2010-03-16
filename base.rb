require 'hyper_cube/cell'
require 'hyper_cube/dimension'
require 'hyper_cube/measure'
require 'hyper_cube/member'
require 'hyper_cube/set'
require 'hyper_cube/tuple'

module HyperCube
  
  class Base

    attr_reader :dimensions
    attr_reader :measures
    
    def initialize(dimensions_count, measures_count)
      @dimensions, @measures, @cells = [], [], {}
      dimensions_count.times { @dimensions << HyperCube::Dimension.new }
      measures_count.times   { @measures   << HyperCube::Measure.new   }
    end
    
    def tuples
      HyperCube::Set.new @dimensions, @cells.keys
    end
    
    def [](tuple)        
      @cells[tuple]
    end
    
    def []=(values, facts)
      tuple = HyperCube::Tuple.new [dimensions, values].transpose.collect { |(dimension, value)| dimension << value }
      cell = HyperCube::Cell.new facts.to_ary
      @cells[tuple] = cell
    end

    def calculate(measure, condition=nil)
      if condition and tuple = condition.to_tuple
        @cells.inject(0.0) { |sum, (t, cell)| tuple.members.subset?(t.members) ? sum + cell[measure] : sum }
      else
        @cells.inject(0.0) { |sum, (t, cell)| sum + cell[measure] }
      end
    end
    
  end
end