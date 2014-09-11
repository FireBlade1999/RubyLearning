
#
# The question of "inheritance vs composition" comes down to an attempt to solve the problem
# of reusable code. You don't want to have duplicated code all over your software.
# 
# Inheritance solves this by creating a mechanism for you to have implied features in base
# classes. 
# 
# Composition solves this by giving you modules and the ability to simply call methods
# in other classes.
#
# If both solutions solve the issue of reuse, then which one is appropriate when? This
# answer is subjective, but there are guidelines.
# 
# 1. avoid multiple inheritance at all costs. If you're stuck with it then be prepared
# to know the class hierarchy and spend time locating the source of where things are
# coming from.
# 2. use composition to package the code into modules that are used in many different
# unrelated places and situations.
# 3. use inheritance only when there are clearly related reusable pieces of code that fit
# under a single common concept or if you have to because of something you're using.
#
# Don't be a slave to these rules. The thing to remember about OOP is that it is entirely
# a social convention programmers have created to package and share code. Because it's a
# social convention, but one that's codified in Ruby, you may be forced to avoid these
# rules because of the people you work with. 