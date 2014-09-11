
require "C://Users//steven.williams//workspace//Samples//RubyWebDriverSample1//RubyWebDriverSample1//lib//Test_Examples//Parser.rb"
require 'test/unit'

class ParserTest < Test::Unit::TestCase
  
  @@parser = Parser.new()
  
  def test_peek_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    assert_equal('noun', @@parser.peek(word_list))
  end
  
  def test_peek_not_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    assert_not_equal('verb', @@parser.peek(word_list))
  end
  
  def test_peek_empty()
    word_list = nil
    assert_equal(nil, @@parser.peek(word_list))
  end
  
  def test_match_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    assert_equal(['noun', 'bear'], @@parser.match(word_list, 'noun'))
  end
  
  def test_match_not_equal()#
    word_list = [['verb', 'eat'], ['noun', 'bob']]
    assert_equal(nil, @@parser.match(word_list, 'noun'))
  end
  
  def test_match_empty()
    word_list = nil
    assert_equal(nil, @@parser.match(word_list, 'noun'))
  end
  
  def test_skip()
    word_list = [['stop', 'it'], ['stop', 'at'], ['verb', 'go'], ['verb', 'eat']]
    assert_equal([['verb', 'go'], ['verb', 'eat']], @@parser.skip(word_list, 'stop'))
  end
  
  def test_parse_verb_simple()
    word_list = [['verb', 'eat'], ['verb', 'go']]
    assert_equal(['verb', 'eat'], @@parser.parse_verb(word_list))
  end
  
  def test_parse_verb_with_stop()
    word_list = [['stop', 'and'], ['verb', 'go']]
    assert_equal(['verb', 'go'], @@parser.parse_verb(word_list))
  end
  
  def test_parse_verb_exception()
    word_list = [['stop', 'and'], ['noun', 'bob'], ['verb', 'go']]
    
    assert_raise ParserException do
      @@parser.parse_verb(word_list)
    end
  end
  
  def test_parse_object_noun_simple()
    word_list = [['noun', 'and']]
    assert_equal(['noun', 'and'], @@parser.parse_object(word_list))
  end
  
  def test_parse_object_direction_simple()
    word_list = [['direction', 'left']]
  end
  
  def test_parse_object_noun_and_direction_simple()
    word_list = [['direction', 'right'], ['noun', 'bob']]
  end
  
  def test_parse_object_with_stop()
    word_list = [['noun', 'bob'], ['stop', 'at'], ['direction', 'down']]
  end
  
  def test_parse_object_exception()
    word_list = [['verb', 'punch']]
  end
  
  
  def test_parse_subject()
    
  end
  
  def test_parse_sentence()
    
  end
end
