class Player
  attr_accessor :name, :score, :hand, :player_number
  
  def initialize(options={})
    @player_number = options[:player_number]
    @game = options[:game]
    @name = ""
    @hand = Hand.new
  end
  
  def set_player_name
    @name = ask_player_name
  end
  
  def ask_player_name
    HighLine.ask "Whats the name for player #{@player_number}?", String
  end
  
  def hit
    @game.deck.deal_card(@hand)
  end
  
  def stand
    return "#{self.name} stood on #{self.hand.value}"
  end
  
  def quit
    @game.players.delete("John")
  end
  
  def turn
    if @hand.status == "Open"
      answer = (Highline.ask "Would you like to Hit, Stand or Quit?", String).downcase
      if answer == "hit"
        hit
        turn
      elsif answer == "stand"
        print stand
      elsif answer == "quit"
        quit
      end
    else
      print @hand.status
    end
  end
  
end