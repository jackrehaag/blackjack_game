require 'rubygems'
require 'bundler/setup'
require 'highline/import'

require File.join(File.dirname(__FILE__), 'deck')
require File.join(File.dirname(__FILE__), 'card')
require File.join(File.dirname(__FILE__), 'player')
require File.join(File.dirname(__FILE__), 'hand')

class Game
  attr_accessor :players, :deck
  def initialize
    @players = []
    @deck = Deck.new
  end
  
  def start
    player_count = ask_player_count
    
    player_count.times do |x|
      @players << Player.new(:player_number => x + 1, :game => @game).set_player_name
    end
  end
  
  def ask_player_count
    HighLine.ask "How many players are there?", Integer
  end
  
  def round
    @players.each do |player|
      player.turn
    end
    
    # reset deck
  end
  
end