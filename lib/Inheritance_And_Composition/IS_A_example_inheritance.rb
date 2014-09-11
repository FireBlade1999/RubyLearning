# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Animal
   
  def initialize()
      
  end
end
  
  
# Dog IS-A animal
class Dog < Animal
    
  # Dog HAS-A name
  def initialize(name)
    @name = name
  end
end
  
class Person
    
  # Person HAS-A name. Person HAS-A pet of some kind.
  def initialize(name)
    @name = name
    @pet = nil
  end
    
  attr_accessor :pet
end


# rover IS-A Dog
rover = Dog.new("rover")

# bernard IS-A Person
bernard = Person.new("bernard")

# bernard HAS-A pet Dog called rover
bernard.pet = rover