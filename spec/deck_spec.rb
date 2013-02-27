require 'spec_helper'

describe Deck do
  before do
    @deck = Deck.new
  end
  it "checks that the deck has the correct amount of cards" do
    @deck.cards.count.should == 52
  end
  
end