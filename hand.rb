class Hand
  attr_accessor :cards
  
  def initialize
    @cards = []
  end
  
  def status
    if value == 21
      return "Blackjack"
    elsif value > 21
      return "Bust"
    else
      return "Open"
    end
  end
  
  def receive(card)
    @cards << card
  end
  
  def value
    high_value > 21 ? low_value : high_value
  end
  
  def high_value
    @cards.inject(0) { |x, c| x + c.high_value }
  end
  
  def low_value
    @cards.inject(0) { |x, c| x + c.low_value }
  end
end