require 'rubygems'
require 'bundler/setup'
require 'highline/import'

require File.join(File.dirname(__FILE__), 'deck')
require File.join(File.dirname(__FILE__), 'card')
require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'hand')
require File.join(File.dirname(__FILE__), 'dealer')

class Game
  attr_accessor :players, :deck
  def initialize
    @players = []
    @deck = Deck.new
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
    @deck = Deck.new # reset deck
  end
  
  def award_points
    @players.each do |player|
      if player.hand.score > @dealer.hand.score && player.hand.score < 22
        player.score += 1
        print "#{player.name} has beaten the dealer's score of #{@dealer.hand.score} with #{player.hand.score}"
        player.hand = []
      end
    end
  end
  
end