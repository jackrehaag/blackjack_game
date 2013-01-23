class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    construct_deck
    @cards.shuffle!
  end
  
  def construct_deck
    suits = %w{clubs diamonds hearts spades}
    ranks = %w{jack queen king}
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(suit, rank, 10, 10)
      end
      @cards << Card.new(suit, "Ace", 11, 1)
      (2..10).each do |x|
        @cards << Card.new(suit, x.to_s, x, x)  
      end
    end
  end
  
  def deal_card(hand)
    hand.receive @cards.shift
  end
end