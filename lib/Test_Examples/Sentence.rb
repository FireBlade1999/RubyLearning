
class Sentence
  
  def initialize(subj, verb, obj)
    puts "take ['noun', 'bear'] pairs and convert them"

    puts "#{subj} #{verb} #{obj}"
    
    @subj = subj[1]
    @verb = verb[1]
    @object = obj[1]
  end
  
  attr_reader :subj
  attr_reader :verb
  attr_reader :object
end
