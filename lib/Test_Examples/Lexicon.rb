#
# Lexicon: 
#   direction words: north, south, east, west, up, down, left, right, back
#   verbs: go, stop, kill, eat
#   stop words: the, in, of, from, at, it
#   nouns: door, bear, princess, cabinet
#   numbers: any string of 0 through 9 chars
# 
# Breaking up words into sentence:
#   stuff = $stdin.gets.chomp
#   words = stuff.split
# 
# Lexicon Tuples:
#   once we know how to break up sentence into words, we just
#   have to go through the words and figure out what type they
#   are. Use an array with just two elements, and create a new
#   array that contains many of these. 
#     eg
#        first_word = ['verb', 'go']
#        second_word = ['direction', 'north']
#        third_word = ['direction', 'west']
#        sentence = [first_word, second_word, third_word]
#   so, take raw input from the user, carve it into words with
#   'split', then analyse those words to identify their type, and
#   finally make a sentence out of them.
#
module Lexicon
  
  # Hashmap of words and types (our lexicon)
  @lexicon = {
    'north'=>'direction',
    'south'=>'direction',
    'east'=>'direction',
    'left'=>'direction',
    'right'=>'direction',
    'up'=>'direction',
    'back'=>'direction',
    'go'=>'verb',
    'stop'=>'verb',
    'kill'=>'verb',
    'eat'=>'verb',
    'the'=>'stop',
    'in'=>'stop',
    'of'=>'stop',
    'from'=>'stop',
    'at'=>'stop',
    'it'=>'stop',
    'door'=>'noun',
    'bear'=>'noun',
    'princess'=>'noun',
    'cabinet'=>'noun',
    '1234'=>'number',
    '3'=>'number',
    '91234'=>'number'
  }
  
  # 
  # Accept raw string input, split it and check each word against the lexicon.
  #
  # returns array of arrays containing the sentence
  #
  def Lexicon.scan(raw)
    rawsplitarray = raw.split
    
    newarray = []
    for word in rawsplitarray
      wordtype = @lexicon[word]
      newarray << [wordtype, word]
    end
    
    return newarray
  end
  
end
