class Player
  attr_accessor :name, :score, :hand
  
  def initialize(options = {})
    unless options.has_key?(:name) && options[:name].kind_of?(String)
      raise ArgumentError, 'Please provide a valid name'
    end
    @name = options[:name]
    @hand = Hand.new
  end
  
end