class Dealer < Player
    
  def initialize(options={})
    @game = options[:game]
    @name = "Dealer"
    @hand = Hand.new
  end
  
  def turn
    high_score = @game.highest_hand
    
    if @hand.status == "Open"
      if @hand.value > high_score
        print stand
      else
        if @hand.value <= 17 
          print hit
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