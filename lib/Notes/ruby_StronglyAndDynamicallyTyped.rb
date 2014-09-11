
#
# Strong typed means once the type of an object is known, you are expected
# to do something that is compatible with that type.
#  eg
#   x = "3"
#   y = x + "ho" // COOL
#   
#   x = "3"
#   y = x + 3 // NOT COOL
# 
# Static typed means the type of a variable is resolved in advance by the
# compiler / interpreter.
#  eg 
#   int x;
#   x = 3;
#   x = "hello"; // ERROR
# 
# Dynamic typed means the type of a variable can change and be resolved on the
# fly at the exact moment it gets parsed by the interpreter.
#  eg
#   x = 3;
#   x = "Transformers"
#   x = :why_are_we_here
#   x = /is this a reg ex/
#   
# Weak typed means for example, C++ where you can use pointers to circumvent
# the type by performing operations on the pointers themselves.
#  eg
#   x = "5" + 6
#     C would convert the string to a pointer representing the address of "5"
#     and add 6 to that to produce a semi-random address.
#
#
# Ruby is BOTH strongly and dynamically typed. Like some other languages it 
# uses the Hindley-Milner method to infer type based on global analysis. C requires
# all variables be declared with a type. C# lies somewhere in-between.
# JavaScript is weakly typed and dynamically typed. A variable does not need a 
# type until you read it or operate upon it.
# 

