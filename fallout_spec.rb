require 'fallout_helper'

describe FalloutHelper, "When one word is added to the helper" do
  
  before do
    @fallout = FalloutHelper.new 'hello' => nil
  end
  
  it "should have the word that was added to it" do
    @fallout.words.keys.should include('hello')
  end
  
  it "should have one word in it" do
    @fallout.words.length.should == 1
  end
  
  it "should be initialized with nil for matches" do
    @fallout.words['hello'].should be_nil
  end

end

describe FalloutHelper, "When multiple words are added to the helper" do
  
  before do
    @fallout = FalloutHelper.new 'IMPORTANT' => nil, 'ACCORDING' => nil, 'OCCUPYING' => nil, 'LOCATIONS' => nil, 
             'GUARDIANS' => nil, 'RESILIENT' => nil, 'RECYCLING' => nil, 'RELEASING' => nil, 
             'RETURNING' => nil, 'INSISTENT' => nil, 'REGARDING' => nil, 'REMINDING' => nil, 
             'THREATENS' => nil, 'REQUIRING' => nil, 'REPAIRING' => nil, 'OCCASIONS' => nil, 
             'ACCEPTING' => nil, 'NECESSARY' => nil, 'DEFEATING' => nil, 'LEUTENANT' => nil

  end
  
  it "should have multiple items in the helper" do
    @fallout.words.length.should == 20
  end
  
  it "should have all items initialized with nil matches" do
    @fallout.words.keys.each { |word| @fallout.words[word].should be_nil }
  end

end

describe FalloutHelper, "When a word has been guessed with matches" do
  
  before do
    @fallout = FalloutHelper.new 'layer' => nil, 'layac' => '', 'yards' => nil
    @fallout.guessed_word 'layer', 3
  end
  
  it "should be able to return possible choices " do
    @fallout.possible_words.length.should == 1
    @fallout.possible_words.should include('layac')
  end
  
end