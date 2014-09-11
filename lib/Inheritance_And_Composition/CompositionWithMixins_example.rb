#
# You can see most of the code in Child and CompositionExample is the same to
# accomplish the same thing. The only difference is that I had to define a 
# Child.override() method to do that one action. Do we need this CompositionExample
# to be a class? Could we just make it into a module named CompositionExample.py? (Python)

# Ruby has another way to do composition using modules and a concept called mixins. You
# simply create a module with methods that are common to classes and then include them in
# your class similar to using 'require'. Here's the above composition using mixins.

module CompositionExampleWithMixins
  
  def override()
    puts "OTHER override()"
  end
  
  def implicit()
    puts "OTHER implicit()"
  end
  
  def CompositionExampleWithMixins.alter()
    puts "OTHER alter()"
  end
end

class ChildClass
  include CompositionExampleWithMixins
  
  def override()
    puts "CHILD override()"
  end
  
  def alter()
    puts "CHILD alter() pre OTHER alter()"
    CompositionExampleWithMixins.alter()
    puts "CHILD alter() post OTHER alter()"
  end
end

kid = ChildClass.new()
kid.implicit()
kid.override()
kid.alter()
