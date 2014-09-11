
# example array usage

# like java arrays, you use index to gain access to the array

ten_things = "Apples Oranges Crows Telephone Light Sugar"

puts "that's not ten things"

stuff = ten_things.split(' ')
more_stuff = ["Day", "Night", "Song", "Frisbee", "Corn", "Banana", "Boy", "Girl"]

# using maths to ensure there's 10 items
while stuff.length != 10
  next_one = more_stuff.pop
  puts "Adding: #{next_one}"
  stuff.push(next_one)
  puts "There's #{stuff} items now"
end

puts "There we go: #{stuff}"

puts "Do more with stuff"

puts "Element 1 = " + stuff[1]
puts "Last Element = " + stuff[-1]
puts "Remove last element and return it = " + stuff.pop()
puts "Return a string by converting array contents to a string separated by sep = " + stuff.join(' ')
puts "Join element 3, 4, and 5 separated by # = " + stuff[3..5].join('#')