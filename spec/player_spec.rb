require 'rubygems'
require 'rspec'

require File.join(File.dirname(__FILE__), '../deck')
require File.join(File.dirname(__FILE__), '../card')
require File.join(File.dirname(__FILE__), '../player')
require File.join(File.dirname(__FILE__), '../hand')

describe Player do
  before do
    @player = Player.new(:name => "Jack")
  end
  it "checks that the player has a name" do
    @player.name.should == "Jack"
  end
  
  it "checks that a player must have a name" do
    expect { Player.new.should raise_error }.to raise_error
  end
  
  it "checks that the player has a hand" do
    @player.hand.cards.should == []
  end
  
  pending "keeps the players score" do
    
  end
  
  pending "lets the player quit the game" do
    @player.quit
    @player.should == nil
  end
  
  pending "should allow the player to hit" do
    expect { @player.hit }.to change{ @player.hand.cards.count }.from(0).to(1)
  end
end