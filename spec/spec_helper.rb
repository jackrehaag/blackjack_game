RSpec.configure do |config|
  config.mock_with :rspec
end

require File.expand_path('../../game', __FILE__)

def give_cards_under_21(players)
  players.each do |player|
    player.hand.cards << Card.new("Hearts", "Jack", 10, 10)
    player.hand.cards << Card.new("Clubs", "7", 7, 7)
  end
end