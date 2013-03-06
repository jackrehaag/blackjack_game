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
  
  it "makes sure that a new deck is used at the end of each play" do
    first_deck = @game.deck
    @game.round_reset
    @game.deck.should_not === first_deck
  end
  
  it "ends the when there are no players left" do
    @game.players.count.should == 2
    Player.any_instance.stub(:ask_to_play) {"no"}
    expect {@game.keep_playing}.to raise_error SystemExit
  end

  it "shows the player scores" do
    @game.players.each do |player|
      player.score = 2
    end
    HighLine.should_receive(:say).with("At the end of that round the scores are:")
    HighLine.should_receive(:say).with("John: 2").twice
    @game.show_player_scores
  end
  
  it "checks that round_reset resets the players hand" do
    give_cards_under_21(@game.players)
    @game.round_reset
    @game.players.first.hand.cards.count.should == 0
  end
  
  it "checks that round_reset resets the dealers hand" do
    @game.dealer.hand.cards << Card.new("Clubs", "7", 7, 7)
    @game.round_reset
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