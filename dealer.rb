class Dealer < Player

  def initialize(options={})
    @game = options[:game]
    @name = "Dealer"
    @hand = Hand.new
  end

  def hit
    @game.deck.deal_card(@hand)
    print "Dealer has hit to reveal #{@hand.cards.last}, Dealer now has #{@hand.value}"
  end

  def stand
    "#{@name} stood on #{@hand.value}"
  end

  def turn
    scores = @game.player.map { |p| p.hand.value}
    high_score = scores.order.last
    
    if @hand.status == "Open"
      if @hand.value > high_score
        stand
      else
        if @hand.value < 17 
          hit
          turn
        elsif @hand.value > 17
          print stand
        end
      end
    else
      print @hand.status
    end
  end

end