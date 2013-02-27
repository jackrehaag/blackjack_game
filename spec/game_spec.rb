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
    @game.players.first.quit
    HighLine.should_receive(:say).with("The game has been terminated")
    @game.players.first.quit
  end

  pending "makes sure that a new deck is used at the end of each play" do
  end

  pending "shows the player scores at the end of the round" do
  end
  
  it "checks that award_points resets the players hand" do
    give_cards_under_21(@game.players)
    @game.award_points
    @game.players.first.hand.cards.count.should == 0
  end
  
  it "checks that award_points resets the dealers hand" do
    @game.dealer.hand.cards << Card.new("Clubs", "7", 7, 7)
    @game.award_points
    @game.dealer.hand.cards.count.should == 0
  end

  it "checks that points are awarded" do
    @game.players.first.score.should == 0
    give_cards_under_21(@game.players)
    @game.dealer.hand.cards << Card.new("Diamonds", "Queen", 10, 10)
    HighLine.should_receive(:say).with("John has beaten the dealer's score of 10 with 17").twice
    @game.award_points
    @game.players.first.score.should == 1
  end
  
  it "checks that points are awarded if the dealer is bust" do
    @game.players.first.score.should == 0
    give_cards_under_21(@game.players)
    give_cards_over_21([@game.dealer])
    @game.award_points
    @game.players.first.score.should == 1
  end
end