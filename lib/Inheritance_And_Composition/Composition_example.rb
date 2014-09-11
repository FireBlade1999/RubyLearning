
#
# Inheritance is useful, but another way to do the exact same thing is just
# to use other classes and modules, rather than rely on implicit inheritance.
# 
# Two of the three ways to exploit inheritance involve writing code to replace
# or alter functionality. This can easily be replicated by just calling methods
# in a module. Here's an example.
#
class CompositionExample
  
  def override()
    puts "OTHER override()"
  end
  
  def implicit()
    puts "OTHER implicit()"
  end
  
  def alter()
    puts "OTHER alter()"
  end  
end

class Child
  
  def initialize()
    @other = CompositionExample.new();
  end
  
  def implicit()
    @other.implicit()
  end
  
  def override()
    puts "CHILD override()"
  end
  
  def alter()
    puts "CHILD alter() prior to OTHER alter()"
    @other.alter()
    puts "CHILD alter() post to OTHER alter()"
  end
end

#
# We're not using 'Parent' noun here. Child does not have a IS-A relationship
# to CompositionExample. Child HAS-A relationship to CompositionExample, as it
# uses it to get its work done.

son = Child.new()

son.implicit()
son.override()
son.alter()
