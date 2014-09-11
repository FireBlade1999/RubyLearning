#
# Multiple inheritance is when you define a class that inherits from one or
# more classes, eg 'class SuperFun(Child, BadStuff): pass', which inherits from 
# Child and BadStuff at the same time. Whenever you have implicit actions on 
# any SuperFun instance, Ruby has to look-up the possible function in the class
# hierarchy for both Child and BadStuff, but in a consistent manner. To do this
# Ruby uses "method resolution order" and an algorithm called C3 to get it rigt.
# You don't need to know how to do that, as Ruby provides the 'super()' method
# which handles this for you. 
# 
# Using 'super()' with '__init__' - the most common use of 'super()' is actually in
# '__init__' methods in base classes. This is usually the only place you need to do
# some things in the child, then finish off the operation in the parent. Here's an
# example.  

#class TheReasonForSuper(Parent)
#  
#  def __init__(self, stuff):
#    self.stuff = stuff
#    super(Child, self).__init__()
#  end
#end

# This is pretty much the same as the 'Child.alter()' example, except we are
# setting some variables in the __init__ method before having the parent 
# initialize with its __init__ method.
