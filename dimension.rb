require 'hyper_cube/member'

module HyperCube
  class Dimension
    
    attr_accessor :sort_by
    
    def initialize
      @members = {}
      @sort_by = Proc.new { |one, another| one.value <=> another.value }
    end

    def <<(value)
      unless @members[value]
        member = Member.new(self, value)
        @members[value] = member
      end  
      @members[value]
    end
    
    def members
      @ordered_members ||= @members.values.sort
    end

  end
end