class FalloutHelper
  attr_accessor :profiles
  attr_accessor :guessed_words
  
  def initialize(words = Array.new)
    @profiles = {}
    @guessed_words = {}
    profile_words words
  end
  
  def match (word1, word2)
    matches = 0
    (0..word1.length-1).each do |index|
        (matches += 1) if (word1[index] == word2[index])
    end
    return matches
  end
  
  def profile_words words
    words.each do |word|
      profile_word word, words
    end
  end
  
  def profile_word word, words
    matches = {}
    words.each do |matching_word|
      matches.merge!({matching_word, match(word, matching_word)}) if matching_word != word
    end
    @profiles.merge!({word, matches})
  end
  
  def add_word word
    update_profiles word
    profile_word word, @profiles.keys
  end
  
  def update_profiles word
    @profiles.each_pair do |key, matches|
      matches.merge!({word, match(key, word)})
    end
  end
  
  def guessed_word(guessed_word, matches)
    @guessed_words.merge!({guessed_word, matches})
  end
  
  def possible_words
    poss_words = @profiles.keys

    #batch all of the non guessed words since they are all that is left
    poss_words.delete_if { |word| @guessed_words.keys.include?(word) }
    
    #remove the word if it is invalid based off previous guessing
    poss_words.each do |word|
      poss_words.delete_if{ |word| is_invalid?(word) } 
    end
  end
  
  def is_invalid? word
    @guessed_words.each_pair do |key, value|
      #puts "word: #{key} - verified: #{@profiles[key][word]} - matched: #{value}"
      return true if(@profiles[key][word] != value) 
    end
    return false
  end
  
  def report
    puts "Guessed Words(#{@guessed_words.size}) with matches"
    @guessed_words.each_pair{|word, matched| puts "#{word}, #{matched}"}
    puts "Possible Words(#{possible_words.size}):"
    puts possible_words
  end
  
end