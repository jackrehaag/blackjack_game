require 'spec_helper'

describe Player do
  before do
    @game = Game.new
    @game.stub(:ask_player_count) { 2 }
    Player.any_instance.stub(:ask_player_name) { "John" }
    @game.start
    @player = Player.new(:player_number => 1, :game => @game)
    @player.set_player_name
  end
  it "checks that the player has a name" do
    @player.name.should == "John"
  end
  
  it "checks that the player has a hand" do
    @player.hand.cards.should == []
  end
  
  pending "keeps the players score" do
    
  end
  
  pending "lets the player quit the game" do
    @player.quit
    @player.should == nil
  end
  
  it "should allow the player to hit" do
    expect { @player.hit }.to change{ @player.hand.cards.count }.from(0).to(1)
  end
  
  pending "should not allow the player to hit if hand is 21 or above" do

  end
  
end