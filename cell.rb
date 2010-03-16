module HyperCube
  class Cell

    def initialize(facts)
      @facts = facts
    end
    
    def [](measure)
      @facts[measure]
    end
    
  end
end
