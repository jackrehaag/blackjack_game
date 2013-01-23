class Card
  attr_accessor :suit, :rank, :high_value, :low_value
  def initialize(suit, rank, high_value, low_value)
    @suit = suit
    @rank = rank
    @high_value = high_value
    @low_value = low_value
  end
end