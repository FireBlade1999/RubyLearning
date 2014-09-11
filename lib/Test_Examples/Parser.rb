
#
# We need to peek at words in the list to decide what kind of sentence we 
# are dealing with. Then we need to match those words to create a Sentence
# object.
#
class Parser

  #
  # peek at a list of words and return what word it is
  # in order to make decisions about what kind of sentence
  # we are dealing with based on what the next word it, then
  # we can call another function to consume that word and 
  # continue
  #
  # return word[0] the type of the next word
  # return nil if word_list is null
  #
  def peek(word_list)
    if word_list
      word = word_list[0]
      return word[0]
    else
      return nil
    end
  end
  
  #
  # Consume a word, confirming it is the expected type, take it off the list
  # and return it
  #
  # return word the first element in the word list
  # return nil if type of word is not what was expected
  # return nil if the word_list is null
  #
  def match(word_list, expecting)
    if word_list
      # retrieve the first element and remove it at the same time, shifting
      # the remaining elements down an index by 1
      word = word_list.shift
      
      if word[0] == expecting  # TODO this feels pointless, you've already checked its type
        return word
      else
        return nil
      end
    else
      return nil
    end
  end
  
  #
  # Skip words that aren't useful to the Sentence. These are words labelled
  # 'stop', skipping as many as we find, eg "scream at the bear" becomes
  # "scream bear"
  # 
  def skip(word_list, word_type)
    # I think the first encounter of a non 'word_type'
    # word, makes this stop, potentially leaving more
    # 'word_type' words left in the sentence. WRONG
#    while peek(word_list) == word_type
#      match(word_list, word_type)
#    end

    # my fix runs the entire array properly
    word_list.each do
      if peek(word_list) == word_type
        match(word_list, word_type)
      end
    end
  end
  
  #
  # Skip the stop words, and peek at the next word to see if it's a verb.
  # If it is, call match with the word list
  # 
  # return result of match method call with word_list
  # raise ParserException if next word is not a verb
  #
  def parse_verb(word_list)
    skip(word_list, 'stop')
    
    if peek(word_list) == 'verb'
      return match(word_list, 'verb')
    else
      raise ParserException.new("Expected a verb next")
    end
  end
  
  #
  # Skip the stop words, and peek at the next word to see if it's an object.
  # If it is, call match with the word_list
  # 
  # return result of match method call with word_list
  # raise ParserException if next word is not an object
  #
  def parse_object(word_list)
    skip(word_list, 'stop')
    
    next_word = peek(word_list)
    if next_word == 'noun'
      return match(word_list, 'noun')
    elsif next_word == 'direction'          # in Ruby, it's 'elsif', not 'elseif'
      return match(word_list, 'direction')
    else
      raise ParserException.new("Expected a noun or direction next")      
    end
  end
  
  #
  # Skip the stop words, and peek at the next word to see if it's a subject.
  # If it is, call match with the word_list if we have a 'noun', else return
  # ['noun', 'player'] if we have a 'verb'
  #
  # return result of match method call with word_list if we have a 'noun'
  # return ['noun', 'player'] if we have a verb
  # raise ParserException if next word is not a subject
  #
  def parse_subject(word_list)
    skip(word_list, 'stop')
    
    next_word = peek(word_list)
    if next_word == 'noun'
      return match(word_list, 'noun')
    elsif next_word == 'verb'
      return ['noun', 'player']
    else
      raise ParserException.new("Expected a verb or a noun next")
    end
  end
  
  #
  # Using the parse methods, create a Sentence object
  #
  # return new Sentence object
  #
  def parse_sentence(word_list)
    subj = parse_subject(word_list)
    verb = parse_verb(word_list)
    obj = parse_object(word_list)
    
    return Sentence.new(subj, verb, obj)
  end
  
end
