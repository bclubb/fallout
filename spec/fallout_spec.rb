require 'lib/fallout_helper'
require 'rubygems'
require 'spec'

describe FalloutHelper, "When one word is added to the helper" do
  
  before do
    @fallout = FalloutHelper.new 
    @fallout.add_word('hello')
  end
  
  it "should have the word that was added to it" do
    @fallout.profiles.keys.should include('hello')
  end
  
  it "should have one word in it" do
    @fallout.profiles.length.should == 1
  end
  
  it "should be initialized with an empty hash for for matches" do
    @fallout.profiles.values.each do |match| 
      match.should == {}
    end
  end

end

describe "multiple words", :shared => true do
  
  it "should have multiple items in the helper" do
    @fallout.profiles.length.should == 20
  end

  it "should have all items initialized with 19 matches profiled" do
    @fallout.profiles.values.each { |profile| profile.length.should == 19 }
  end
  
end

describe FalloutHelper, "When multiple words are added to the helper at initialization" do
  
  before do
    @fallout = FalloutHelper.new ['IMPORTANT', 'ACCORDING', 'OCCUPYING', 'LOCATIONS', 
                                  'GUARDIANS', 'RESILIENT', 'RECYCLING', 'RELEASING', 
                                  'RETURNING', 'INSISTENT', 'REGARDING', 'REMINDING', 
                                  'THREATENS', 'REQUIRING', 'REPAIRING', 'OCCASIONS', 
                                  'ACCEPTING', 'NECESSARY', 'DEFEATING', 'LEUTENANT']
    @fallout.guessed_word 'ACCEPTING', 3
    #@fallout.report
    @fallout.guessed_word 'NECESSARY', 1
    #@fallout.report
  end
  
  it_should_behave_like "multiple words"
  
end

describe FalloutHelper, "When multiple words are added to the helper at initialization" do
  
  before do
    @fallout = FalloutHelper.new
    @fallout.add_word 'IMPORTANT'
    @fallout.add_word 'ACCORDING'
    @fallout.add_word 'OCCUPYING'
    @fallout.add_word 'LOCATIONS'
    @fallout.add_word 'GUARDIANS'
    @fallout.add_word 'RESILIENT'
    @fallout.add_word 'RECYCLING'
    @fallout.add_word 'RELEASING'
    @fallout.add_word 'RETURNING'
    @fallout.add_word 'INSISTENT'
    @fallout.add_word 'REGARDING'
    @fallout.add_word 'REMINDING'
    @fallout.add_word 'THREATENS'
    @fallout.add_word 'REQUIRING'
    @fallout.add_word 'REPAIRING'
    @fallout.add_word 'OCCASIONS'
    @fallout.add_word 'ACCEPTING'
    @fallout.add_word 'NECESSARY'
    @fallout.add_word 'DEFEATING'
    @fallout.add_word 'LEUTENANT'
  
    
    @fallout.guessed_word 'ACCEPTING', 3
    #@fallout.report
    @fallout.guessed_word 'NECESSARY', 1
    #@fallout.report
  end
  
  it_should_behave_like "multiple words"
  
end

describe FalloutHelper, "When a word has been guessed with matches" do
  
  before do
    @fallout = FalloutHelper.new ['layer', 'layac', 'yards']
    @fallout.guessed_word 'layer', 3
  end
  
  it "should be able to return possible choices" do
    @fallout.possible_words.length.should == 1
    @fallout.possible_words.should include('layac')
  end
  
end

describe FalloutHelper, "When a word is matched against another" do
  before do
    @fallout = FalloutHelper.new ['layer', 'layac', 'yards']
  end
  
  it "all identical letters at identical indexes should be matched and counted" do
    @fallout.match("later", "aseer").should == 2
  end
end