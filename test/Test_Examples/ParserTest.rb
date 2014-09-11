
require "C://Users//steven.williams//workspace//Samples//RubyWebDriverSample1//RubyWebDriverSample1//lib//Test_Examples//Parser.rb"
require 'test/unit'

class ParserTest < Test::Unit::TestCase
  
  def test_peek_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    parser = Parser.new()
    assert_equal('noun', parser.peek(word_list))
  end
  
  def test_peek_not_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    parser = Parser.new()
    assert_not_equal('verb', parser.peek(word_list))
  end
  
  def test_peek_empty()
    word_list = nil
    parser = Parser.new()
    assert_equal(nil, parser.peek(word_list))
  end
  
  def test_match_equal()
    word_list = [['noun', 'bear'], ['noun', 'bob']]
    parser = Parser.new()
    assert_equal(['noun', 'bear'], parser.match(word_list, 'noun'))
  end
  
  def test_match_not_equal()#
    word_list = [['verb', 'eat'], ['noun', 'bob']]
    parser = Parser.new()
    assert_equal(nil, parser.match(word_list, 'noun'))
  end
  
  def test_match_empty()
    word_list = nil
    parser = Parser.new()
    assert_equal(nil, parser.match(word_list, 'noun'))
  end
  
  def test_skip()
    word_list = [['stop', 'it'], ['stop', 'at'], ['verb', 'go'], ['verb', 'eat']]
    parser = Parser.new()
    assert_equal([['verb', 'go'], ['verb', 'eat']], parser.skip(word_list, 'stop'))
  end
  
  def test_parse_verb()
    
  end
  
  def test_parse_object()
    
  end
  
  def test_parse_subject()
    
  end
  
  def test_parse_sentence()
    
  end
end
