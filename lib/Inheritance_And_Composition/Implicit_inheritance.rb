#
# Inheritance can be implicit, whereby the child has no 
# distinct implementation of its own.
#

class ImplicitInheritance
  def initialize
    
  end
  
  def implicit()
    puts "PARENT implicit()"
  end
end

class Child < ImplicitInheritance
end

dad = ImplicitInheritance.new()
son = Child.new()

dad.implicit()
son.implicit()

#
# Or, it can be overridden so the child adds to, or simply
# implements the contract
#

class OverrideInheritance
  
  def override()
    puts "PARENT override()"
  end
end

class OveridingChild < OverrideInheritance
  
  def override()
    puts "CHILD override"
  end
end

parent = OverrideInheritance.new()
sprog = OveridingChild.new()

parent.override()
sprog.override()

#
# The third way, is to call super
#
class Father
  
  def alter()
    puts "PARENT alter()"
  end
end

class Daughter < Father
  
  def alter()
    puts "CHILD alter() pre super call"
    super()
    puts "CHILD alter() post super call"
  end
end

father = Father.new()
daughter = Daughter.new()

father.alter()
daughter.alter()