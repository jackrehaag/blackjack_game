require 'spec_helper'

describe Game do
  before do
    @game = Game.new
    @game.stub(:ask_player_count) { 2 }
    Player.any_instance.stub(:ask_player_name) { "John" }
    @game.start
  end
  
  it "makes sure that a game has at least one player" do
    @game.players.count.should == 2
  end
  
  it "makes sure a game ends when the last player leaves" do
    @game.players[0].quit
    @game.players[1].quit
    @game.should == nil
  end
  
  pending "makes sure that a new deck is used at the end of each play" do
  end
end