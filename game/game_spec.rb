require_relative 'game'

describe Game do
  before do
    @game = Game.new("knuckleheads")
    
    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
    $stdout = StringIO.new
    
    Die.any_instance.stub(:roll).and_return(5)
  end
  it "should w00t a player if a high number is rolled" do
    @player.roll.should == @health + 15
  end
end