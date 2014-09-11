

require 'C://Users/steven.williams//workspace//Samples//RubyWebDriverSample1//RubyWebDriverSample1//lib//Test_Examples//Lexicon.rb'
require 'test/unit'

class LexiconTest < Test::Unit::TestCase
  
  #
  # Verify Lexicon.scan using directions
  #
  # TODO: split this to avoid one assert fail stopping the remaining asserts
  # from being executed
  #
  def test_directions()
    # Scenario #1. 
    # given string of raw input
    # 
    # when scan scans the lexicon and determines the word
    # type is valid
    # 
    # then return sentence composed of array of arrays with
    # [TOKEN, WORD] pairings.
    assert_equal(Lexicon.scan("north"), [['direction', 'north']])
    
    result = Lexicon.scan("north south east")
    
    assert_equal(result, [['direction', 'north'],
        ['direction', 'south'],
        ['direction', 'east']])
    
    # Scenario #2. 
    # given string containing direction
    # when scan runs and finds word not in lexicon
    # then return sentence composed of array of arrays with
    # [ERROR, WORD]
  end
  
  #
  # Verify Lexicon.scan using verbs
  #
  # TODO: split this to avoid one assert fail stopping the remaining asserts
  # from being executed
  #
  def test_verbs()
    assert_equal(Lexicon.scan("go"), [['verb', 'go']])
    
    result = Lexicon.scan("go kill eat")
    assert_equal(result, [['verb', 'go'],
        ['verb', 'kill'],
        ['verb', 'eat']])
  end
  
  #
  # Verify Lexicon.scan using stops
  #
  # TODO: split this to avoid one assert fail stopping the remaining asserts
  # from being executed
  #
  def test_stops()
    assert_equal(Lexicon.scan("the"), [['stop', 'the']])
    
    result = Lexicon.scan("the in of from at it")
    assert_equal(result, [['stop', 'the'],
        ['stop', 'in'],
        ['stop', 'of'],
        ['stop', 'from'],
        ['stop', 'at'],
        ['stop', 'it']])
  end
  
  #
  # Verify Lexicon.scan using nouns
  #
  # TODO: split this to avoid one assert fail stopping the remaining asserts
  # from being executed
  #
  def test_nouns()
    assert_equal(Lexicon.scan("door"), [['noun', 'door']])
    
    result = Lexicon.scan("door bear princess cabinet")
    assert_equal(result, [['noun', 'door'],
        ['noun', 'bear'],
        ['noun', 'princess'],
        ['noun', 'cabinet']])
  end
  
  #
  # Verify Lexicon.scan using numbers
  #
  # TODO: split this to avoid one assert fail stopping the remaining asserts
  # from being executed
  #
  def test_numbers()
    assert_equal(Lexicon.scan("1234"), [['number', '1234']])
    
    result = Lexicon.scan("3 91234")
    assert_equal(result, [['number', '3'],
        ['number', '91234']])
  end
  
end