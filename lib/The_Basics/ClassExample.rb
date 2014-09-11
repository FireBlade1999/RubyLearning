
# Classes are like Modules. In the case of a hash(map) the 
# key is a string [key], in the case of a module (a special hash
# that can store Ruby code so you can get to it with 'dot' , the key
# is an identifier .key, other than that they are nearly the 
# same thing. Like a module, in a class you access the variables
# and methods with 'dot' like you would in Java.
# 
# As with Java, class is a cookie-cutter, you create any number
# of objects. Modules are singletons kind of, when you import it
# there is only one for the entire program.
# 
# The equivalent to 'require' in a module, for a class, is instantiate.
# In Ruby you do this with 'thing = ExampleClass.new()'. 
# 
# @tangerine means exposing a variable 'tangerine' to users of 'ExampleClass'.
# @ means instance variable. $ means global variable.
#
# class = cookie-cutter
# object = instance of some thing
# instance = the result of creating an object of type class
# self = inside the functions in a class, self is a var for the object being accessed
# def = how you define a method
# inheritance = one class inherits traits of another
# composition = one class can be composed of others
# attribute = a property classes have that are from composition usually variables
# is-a = something inherits from another, salmon is-a fish. In Ruby, "class Milk < Drink" milk inherits "is-a" from Drink
# has-a = composed of other things, salmon has a mouth, ie a reference to some other class
# 
# classX(Y) = make a class X that is-a Y
# classX(object):def initialize(J) = class X has-a initialize that takes a J
# classX(object):def M(self, J) = class X has-a function named M that takes J
# foo = X() = set foo to an instance of class X
# foo.M(J) = from foo, get the M method and pass J
# foo.K=Q = from foo, get K attribute and set it to Q

class ExampleClass
  
  def initialize()
    @tangerine = "And now a thousand years between"    
  end
  
  def apple()
    puts "I am an apple"
  end
  
end
