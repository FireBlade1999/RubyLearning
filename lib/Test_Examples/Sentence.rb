
class Sentence
  
  def initialize(subject, verb, obj)
    # take ['noun', 'bear'] pairs and convert them
    @subject = subject[1]
    @verb = verb[1]
    @object = obj[1]
  end
  
  attr_reader :subject
  attr_reader :verb
  attr_reader :object
end
