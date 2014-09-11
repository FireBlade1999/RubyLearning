
#
# Accompanies 'Test Files/Test_Examples/RoomTest.rb'
#

class Room
  
  def initialize(name, description)
    @name = name
    @description = description
    @paths = {}
  end
  
  # these make it easy to access the variables
  attr_reader :name
  attr_reader :description
  attr_reader :paths
  
  def go(direction)
    return @paths[direction]
  end
  
  def add_paths(paths)
    @paths.update(paths)
  end
end
