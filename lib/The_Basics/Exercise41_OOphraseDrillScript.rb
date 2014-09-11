
# a little Ruby hack script that will drill you on these words you know in an 
# infinite manner. This is a simple script you should be able to figure out, 
# and the only thing it does is use a library called urllib to download a list 
# of words I have. Here’s the script, which you should run from cmd_line to 
# work with it.

# Run this script and try to translate the “object-oriented phrases” into English 
# translations. You should see that the PHRASES dict has both forms and you just 
# have to enter the correct one


require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = [] 

PHRASES = {
  "class ### < ###\nend" => "Make a class named ### that is-a ###.",
  "class ### < ###\nend" => "Make a class named ### that is-a ###.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" => "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" => "Set *** to an instance of class ###.",
  "***.***(@@@)" => "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" => "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == "english"

open(WORD_URL) {|f| 
  f.each_line {|word| WORDS.push(word.chomp)}
}

def craft_names(rand_words, snippet, pattern, caps=false)
  names = snippet.scan(pattern).map do 
    word = rand_words.pop()
    caps ? word.capitalize : word
  end 

  return names * 2 
end 

def craft_params(rand_words, snippet, pattern)
  names = (0...snippet.scan(pattern).length).map do 
    param_count = rand(3) + 1 
    params = (0...param_count).map {|x| rand_words.pop() }
    params.join(', ')
  end 

  return names * 2 
end 

def convert(snippet, phrase)
  rand_words = WORDS.sort_by {rand}
  class_names = craft_names(rand_words, snippet, /###/, caps= true )
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = [] 

  for sentence in [snippet, phrase] 
    # fake class names, also copies sentence 
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names 
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists 
    result.gsub!(/@@@/) {|x| param_names.pop }

    results.push(result)
  end 

  return results
end 

# keep going until they hit CTRL-D 
loop do 
  snippets = PHRASES.keys().sort_by {rand}

  for snippet in snippets
    phrase = PHRASES[snippet] 
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end 

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER: %s\n\n" % answer
  end 
end 