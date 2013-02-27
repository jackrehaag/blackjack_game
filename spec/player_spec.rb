require 'spec_helper'

describe Player do
  before do
    @game = Game.new
    @game.stub(:ask_player_count) { 2 }
    Player.any_instance.stub(:ask_player_name) {'John'}
    @game.start
    @player = @game.players.first
  end
  it "checks that the player has a name" do
    @player.name.should == "John"
  end
  
  it "checks that the player has a hand" do
    @player.hand.cards.should == []
  end
  
  it "makes sure that each player takes two cards" do
    expect { @player.take_two }.to change{ @player.hand.cards.count }.from(0).to(2)
  end
  
  it "lets the player quit the game" do
    @game.players.count.should == 2
    @player.quit
    @game.players.count.should == 1
  end
  
  it "checks that the players name and hand is announced on their turn" do
    @player.hand.cards << Card.new("Clubs", "2", 2, 2)
    @player.hand.cards << Card.new("Hearts", "Ace", 1, 11)
    
    HighLine.should_receive(:say).with("John its your turn, your hand currently contains:")
    HighLine.should_receive(:say).with("the #{@player.hand.cards.first.rank} of #{@player.hand.cards.first.suit}")
    HighLine.should_receive(:say).with("the #{@player.hand.cards.last.rank} of #{@player.hand.cards.last.suit}")
    
    @player.stub(:ask_player_action).with {"stand"}
    @player.turn
  end
  
  it "should allow the player to hit" do
    expect { @player.hit }.to change{ @player.hand.cards.count }.from(0).to(1)
  end
  
  it "should allow the player to stand" do
    @player.stand.should == "John stood on 0"
  end
  
  it "should not ask the player to hit if hand is 21 or above" do
    @player.hand.cards << Card.new("Hearts", "Jack", 10, 10)
    @player.hand.cards << Card.new("Clubs", "Jack", 10, 10)
    @player.hand.cards << Card.new("Hearts", "Ace", 1, 11)
    
    HighLine.should_receive(:say).with("Blackjack")
    @player.turn
  end
  
end