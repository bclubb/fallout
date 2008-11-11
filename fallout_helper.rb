Guess = Struct.new(:word, :matches)

class FalloutHelper
  attr_accessor :words
  
  def initialize
    words = []
  end
  
  def add_word word, matches
    guess = Guess.new word, matches
    self.words << {word => guess}
  end
  
  def guessed_word(word, matches)
    self.words[word] = matches
  end
  
  def possible_words
    poss_words = {}
    self.words.keys.each do |word|
      if(word.matches.nil?) 
        poss_words.merge!(word) 
      end
    end
  end
end