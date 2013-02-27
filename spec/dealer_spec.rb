require 'spec_helper'

describe Dealer do
  
  before do
    @game = Game.new
    @game.stub(:ask_player_count) { 2 }
    Player.any_instance.stub(:ask_player_name) {'John'}
    @dealer = @game.dealer
    @game.start
  end
  
  it "should make sure the dealer hits when less than 17 and has not beaten the highest hand" do
    @dealer.hand.cards << Card.new("Clubs", "6", 6, 6)
    @game.players.first.hand.cards << Card.new("Clubs", "8", 8, 8)
    expect { @dealer.turn }.to change{ @dealer.hand.value && @dealer.hand.cards.count }
  end
  
  it "should make sure the dealer stands when less than 17 but has beaten the highest hand" do
    @dealer.hand.cards << Card.new("Clubs", "6", 6, 6)
    @game.players.first.hand.cards << Card.new("Clubs", "2", 2, 2)
    expect { @dealer.turn }.to_not change{ @dealer.hand.value && @dealer.hand.cards.count }
  end
  
  it "should make sure that the dealer stands when over 17" do
    @dealer.hand.cards << Card.new("Clubs", "6", 6, 6)
    @dealer.hand.cards << Card.new("Hearts", "10", 10, 10)
    @dealer.hand.cards << Card.new("Hearts", "2", 2, 2)
    expect { @dealer.turn }.to_not change{ @dealer.hand.value && @dealer.hand.cards.count }
  end
  
  it "checks that the dealer stands when it has beaten highest players score" do
    @dealer.hand.cards << Card.new("Clubs", "4", 4, 4)
    @dealer.hand.cards << Card.new("Hearts", "10", 10, 10)
  
    @game.players.first.hand.cards << Card.new("Clubs", "2", 2, 2)
    @game.players.first.hand.cards << Card.new("Hearts", "10", 10, 10)
    expect { @dealer.turn }.to_not change{ @dealer.hand.value && @dealer.hand.cards.count }
  end
  
end