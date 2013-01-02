class Card
  attr_accessor :suit, :rank, :value
  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @value = value
  end
end