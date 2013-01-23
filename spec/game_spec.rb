require 'spec_helper'

describe Game do
  before do
    # HighLine.stub(:ask) {2}

    @game = Game.new
    @game.stub(:ask_player_count) { 2 }
    Player.any_instance.stub(:ask_player_name) { "John" }
    @game.start
  end
  
  it "makes sure that a game has at least one player" do
    @game.players.count.should == 2
  end
  
  pending "makes sure a game ends when the last player leaves" do
    
  end
  
  pending "makes sure that a new deck is used when the old one is empty" do
    
  end
end