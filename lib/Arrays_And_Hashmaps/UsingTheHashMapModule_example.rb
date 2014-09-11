
# use the Dict module you created to demonstrate how a hashmap is built

require './MakingAHashMapModule_example.rb'

# test it works

jazz = Dict.new()

# set(aDict, k, v)
Dict.set(jazz, 'Miles Davis', 'Flamenco Sketches')

# confirm set will replace previous one
Dict.set(jazz, 'Miles Davis', 'Kind Of Blue')
Dict.set(jazz, 'Duke Ellington', 'Beginning To See The Light')
Dict.set(jazz, 'Billy Strayhorn', 'Lush Life')

puts "---- List Test ----"
Dict.list(jazz)

puts "---- Get Test ----"
puts Dict.get(jazz, 'Miles Davis')
puts Dict.get(jazz, 'Duke Ellington')
puts Dict.get(jazz, 'Billy Strayhorn')

puts "---- Delete Test ----"
puts "Goodbye Miles"
Dict.delete(jazz, "Miles Davis")
Dict.list(jazz)

puts "Goodbye Duke"
Dict.delete(jazz, "Duke Ellington")
Dict.list(jazz)

puts "Goodbye Pork Pie Hat"
Dict.delete(jazz, "Charles Mingus")