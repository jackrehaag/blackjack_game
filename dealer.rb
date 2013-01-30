class Dealer < Player
    
  def initialize(options={})
    @game = options[:game]
    @name = "Dealer"
    @hand = Hand.new
  end
  
  def turn
    scores = @game.players.map { |p| p.hand.value}
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