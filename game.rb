require 'rubygems'
require 'bundler/setup'
require 'highline/import'

require File.join(File.dirname(__FILE__), 'deck')
require File.join(File.dirname(__FILE__), 'card')
require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'hand')
require File.join(File.dirname(__FILE__), 'dealer')

class Game
  attr_accessor :players, :deck, :dealer
  def initialize
    @players = []
    @deck = Deck.new
    @dealer = Dealer.new(:game => self)
  end
  
  def start
    player_count = ask_player_count
    
    player_count.times do |x|
      player = Player.new(:player_number => x + 1, :game => self)
      player.set_player_name
      @players << player
    end
  end
  
  def ask_player_count
    HighLine.ask "How many players are there?", Integer
  end
  
  def highest_hand
    scores = @players.map { |p| p.hand.value}
    high_score = scores.sort.last
  end
  
  def round
    @players.each do |player|
      player.take_two
      player.turn
    end
    @dealer.turn
    award_points
    round_reset
    show_player_scores
  end
  
  def round_reset
    @deck = Deck.new
    @dealer.hand = Hand.new
    @players.each do |player|
      player.hand = Hand.new
    end
  end
  
  def award_points
    @players.each do |player|
      if @dealer.hand.value < 22
        if player.hand.value > @dealer.hand.value && player.hand.value < 22
          player.score += 1
          HighLine.say("#{player.name} has beaten the dealer's score of #{@dealer.hand.value} with #{player.hand.value}")
        end
      else # Dealer has bust
        if player.hand.value < 22
          player.score += 1
          HighLine.say("The dealer has bust #{player.name} has beaten the dealer's score of #{@dealer.hand.value} with #{player.hand.value}")
        end
      end
    end
  end
  
  def show_player_scores
    HighLine.say("At the end of that round the scores are:")
    @players.each do |player|
      HighLine.say("#{player.name}: #{player.score}")
    end
  end
  
end