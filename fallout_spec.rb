require 'fallout_helper'

describe FalloutHelper, "When one word is added to the helper" do
  
  before do
    @fallout = FalloutHelper.new 
    @fallout.add_word('hello', nil)
  end
  
  it "should have the word that was added to it" do
    literal_words = @fallout.words.map do |word| word.word end
    literal_words.should include('hello')
  end
  
  it "should have one word in it" do
    @fallout.words.length.should == 1
  end
  
  it "should be initialized with nil for matches" do
    @fallout.words.each do |word| word.matches.should be_nil end
  end

end

describe FalloutHelper, "When multiple words are added to the helper" do
  
  before do
    @fallout = FalloutHelper.new [Guess.new('IMPORTANT',nil), Guess.new('ACCORDING',nil), Guess.new('OCCUPYING',nil), Guess.new('LOCATIONS',nil), 
                                  Guess.new('GUARDIANS',nil), Guess.new('RESILIENT',nil), Guess.new('RECYCLING',nil), Guess.new('RELEASING',nil), 
                                  Guess.new('RETURNING',nil), Guess.new('INSISTENT',nil), Guess.new('REGARDING',nil), Guess.new('REMINDING',nil), 
                                  Guess.new('THREATENS',nil), Guess.new('REQUIRING',nil), Guess.new('REPAIRING',nil), Guess.new('OCCASIONS',nil), 
                                  Guess.new('ACCEPTING',nil), Guess.new('NECESSARY',nil), Guess.new('DEFEATING',nil), Guess.new('LEUTENANT',nil)]

  end
  
  it "should have multiple items in the helper" do
    @fallout.words.length.should == 20
  end
  
  it "should have all items initialized with nil matches" do
    @fallout.words.each { |word| word.matches.should be_nil }
  end

end

describe FalloutHelper, "When a word has been guessed with matches" do
  
  before do
    @fallout = FalloutHelper.new [Guess.new('layer', nil), Guess.new('layac', ''), Guess.new('yards', nil)]
    @fallout.guessed_word 'layer', 3
  end
  
  it "should be able to return possible choices " do
    @fallout.possible_words.length.should == 3
    @fallout.possible_words.should include('layac')
  end
  
end