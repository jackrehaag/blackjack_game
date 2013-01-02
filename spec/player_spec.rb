require 'rubygems'
require 'rspec'

require File.join(File.dirname(__FILE__), '../deck')
require File.join(File.dirname(__FILE__), '../card')

describe Player do
  before do
    @player = Player.new
  end
  it "checks that the player has a name" do
    
  end
  
  it "checks that the player has a hand" do
    @player.hand.should == []
  end
  
  it "keeps the players score" do
    
  end
end