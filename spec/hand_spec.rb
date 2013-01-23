require 'spec_helper'

describe Hand do
  
  before do
    @hand = Hand.new
    @deck = Deck.new
  end
  
  it "should minus 10 from the total for each ace when bust" do
    @hand.cards << Card.new("Diamonds", "Ace", 11, 1)
    @hand.cards << Card.new("Clubs", "6", 6, 6)
    @hand.cards << Card.new("Clubs", "5", 5, 5)
    @hand.value.should == 12
  end
  
  it "should change status to bust when hand value is more than 21" do
    @hand.cards << Card.new("Diamonds", "Jack", 10, 10)
    @hand.cards << Card.new("Hearts", "Jack", 10, 10)
    @hand.cards << Card.new("Clubs", "Jack", 10, 10)
    
    @hand.status.should == "Bust"
  end
  
  it "should change status to blackjack when hand value is 21" do
    @hand.cards << Card.new("Diamonds", "Jack", 10, 10)
    @hand.cards << Card.new("Clubs", "6", 6, 6)
    @hand.cards << Card.new("Clubs", "5", 5, 5)
    
    @hand.status.should == "Blackjack"
  end
  
  it "should work out the value of the hand" do
    @hand.cards << Card.new("Diamonds", "5", 5, 5)
    @hand.cards << Card.new("Clubs", "5", 5, 5)
    
    @hand.value.should == 10
  end
end