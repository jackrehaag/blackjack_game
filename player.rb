class Player
  attr_accessor :name, :score, :hand, :player_number
  
  def initialize(options={})
    @player_number = options[:player_number]
    @game = options[:game]
    @name = ""
    @hand = Hand.new
    @score = 0
  end
  
  def set_player_name
    @name = ask_player_name
  end
  
  def ask_player_name
    HighLine.ask "Whats the name for player #{@player_number}?", String
  end
  
  def hit
    @game.deck.deal_card(@hand)
    return "#{@name} has hit to reveal #{@hand.cards.last.rank} of #{@hand.cards.last.suit}, #{@name} now has #{@hand.value}"
  end
  
  def take_two
    @game.deck.deal_card(@hand)
    @game.deck.deal_card(@hand)
  end
  
  def stand
    return "#{self.name} stood on #{self.hand.value}"
  end
  
  def ask_player_action
    (HighLine.ask "Would you like to Hit, Stand or Quit?", String).downcase
  end
  
  def quit
    if @game.players.count == 1
      HighLine.say("The game has been terminated")
      exit
    else
      HighLine.say("#{self.name} has quit the game")
      @game.players.delete(self)
    end
  end
  
  def process_answer(answer)
    if answer == "hit"
      HighLine.say hit
      turn
    elsif answer == "stand"
      HighLine.say stand
    elsif answer == "quit"
      quit
    else
      return false
    end
  end
  
  def player_action
    answer = ask_player_action
    if process_answer(answer) == false
      HighLine.say("Please enter a correct command")
      player_action
    end
  end
  
  def turn
    if @hand.status == "Open"
      HighLine.say("#{@name} its your turn, your hand currently contains:")
      @hand.cards.each do |card|
        HighLine.say("the #{card.rank} of #{card.suit}")
      end
      player_action
    else
      HighLine.say("#{@hand.status}")
    end
  end
  
end