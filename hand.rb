class Hand
  attr_accessor :cards
  
  def initialize
    @cards = []
  end
  
  def status
    if self.value == 21
      return "Blackjack"
    elsif value > 21
      return "Bust"
    else
      return "Open"
    end
  end
  
  def value
    x = 0
    aces = 0
    @cards.each do |card|
      x = x + card.value
    end
    if x > 21
      ranks = @cards.map { |c| c.rank }
      aces = ranks.grep("Ace").size
      x = x - (aces * 10)
    end
    return x
  end
end