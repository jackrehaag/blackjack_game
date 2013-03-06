#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), 'game')
HighLine.say("Welcome to Blackjack")
@game = Game.new
@game.start
until @game.players.count < 1
  @game.round
end
