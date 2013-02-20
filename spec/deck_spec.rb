require 'spec_helper'

describe Deck do
  before do
    @deck = Deck.new
  end
  it "checks that the deck has the correct amount of cards" do
    @deck.cards.count.should == 52
    # @deck.cards.each do |card|
    #   p card.rank + " of " + card.suit
    # end
  end
  
end