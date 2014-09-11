
require "C://Users//steven.williams//workspace//Samples//RubyWebDriverSample1//RubyWebDriverSample1//lib//Test_Examples//ParserException.rb"
require "C://Users//steven.williams//workspace//Samples//RubyWebDriverSample1//RubyWebDriverSample1//lib//Test_Examples//Parser.rb"
require 'test/unit'

class ParserExceptionTest < Test::Unit::TestCase

  def test_parserexception()
    assert_raise ParserException do
      parser = Parser.new()
      puts "Running ParserExceptionTest: Expect <'ParserException: Expected a verb next'> message..."
      parser.parse_verb(['noun', 'bear'])
    end
  end
  
end
