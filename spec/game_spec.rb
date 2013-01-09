require 'rubygems'
require 'rspec'

require File.join(File.dirname(__FILE__), '../deck')
require File.join(File.dirname(__FILE__), '../card')
require File.join(File.dirname(__FILE__), '../player')
require File.join(File.dirname(__FILE__), '../hand')

describe Game do
  before do
    @game = Game.new
  end
  
  it "makes sure that a game has at least one player" do
    
  end
  
  it "makes sure that their can only be a maximum of 4 players" do
    
  end
  
  it "makes sure a game ends when the last player leaves" do
    
  end
end