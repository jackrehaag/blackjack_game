require 'rubygems'
require 'rspec'

require File.join(File.dirname(__FILE__), '../deck')
require File.join(File.dirname(__FILE__), '../card')

describe Deck do
  before do
    @deck = Deck.new
  end
  it "checks that the deck has the correct amount of cards" do
    @deck.cards.count.should == 52
    @deck.cards.each do |card|
      p card.rank + " of " + card.suit
    end
  end
  
  it "should remove the card from the deck when dealt" do
    @deck.deal_card
    @deck.cards.count.should == 51
  end
  
  it "should pick a card at random from the deck" do
    card_1 = @deck.deal_card
    card_2 = @deck.deal_card
    card_1.should_not == card_2
  end
  
end