require_relative 'game'	

describe Game do
  before do
    $stdout = StringIO.new
    @game = Game.new("knuckleheads")
    
    @initial_health = 100
    @player = Player.new("joe", @initial_health)
    
    @game.add_player(@player)

  end 
  it "should w00t a player if a high number is rolled" do
    GameTurn.stub(:number_rolled).and_return(5)
    @game.play(4)
    @player.health.should == @initial_health  + (15 * 4)
  end

  it "should blam a player if a low number is rolled" do
    GameTurn.stub(:number_rolled).and_return(2)
    @game.play(4)
    @player.health.should == @initial_health - (10 * 4)
  end

  it "should do nothing if a medium number is rolled" do
    GameTurn.stub(:number_rolled).and_return(3)
    @game.play(4)
    @player.health.should == @initial_health
  end
end