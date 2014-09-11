
#
# Exercise 40 in Learn Ruby The Hard Way
#

class Song
  
  # I've noticed in Ruby you don't have to declare a type
  # for the vars, it's implicit, like in JS.
  
  def initialize(lyrics)
    # instance var lyrics
    @lyrics = lyrics
  end
  
  def sing_me_a_song()
    @lyrics.each {|line| puts line}
  end
end

happy_bday = Song.new(["Happy birthday to you"])

bulls_on_parade = Song.new(["They rally round the family"])

happy_bday.sing_me_a_song()

bulls_on_parade.sing_me_a_song()
