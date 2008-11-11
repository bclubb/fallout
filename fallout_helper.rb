Guess = Struct.new(:word, :matches)

class FalloutHelper
  attr_accessor :words
  
  def initialize(words = Array.new)
    self.words = words
  end
  
  def add_word word, matches
    guess = Guess.new(word, matches)
    self.words << guess
  end
  
  def guessed_word(guessed_word, matches)
    self.words.each do |word| 
      if(word.word == guessed_word) 
        word.matches = matches 
      end 
    end
  end
  
  def possible_words
    poss_words = Array.new
    self.words.each do |word|
      if(word.matches.nil?) 
        poss_words << (word.word) 
      end
    end
  end
end