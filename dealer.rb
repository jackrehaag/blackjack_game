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
        HighLine.say stand
      else
        if @hand.value <= 17 
          HighLine.say hit
          turn
        elsif @hand.value > 17
          HighLine.say stand
        end
      end
    else
      HighLine.say("#{@hand.status}")
    end
  end

end