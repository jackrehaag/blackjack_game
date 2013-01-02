class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    construct_deck
    @cards.shuffle!
  end
  
  def construct_deck
    suits = ["clubs", "diamonds", "hearts", "spades"]
    ranks = ["Jack", "Queen", "King"]
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(suit, rank, 10)
      end
      @cards << Card.new(suit, "Ace", 11)
      (2..10).each do |x|
        @cards << Card.new(suit, x.to_s, x)  
      end
    end
  end
  
  def deal_card
    @cards.shift
  end
end