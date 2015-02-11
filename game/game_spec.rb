require_relative 'game'
require_relative 'die'
describe Game do
  before do
    @game = Game.new("knuckleheads")
    
    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
    $stdout = StringIO.new  
  end
  it "should w00t a player if a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play
    @player.health.should == @initial_health + 15
  end
  it "health should stay the same if mid number rolled on die" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.health.should == @initial_health
  end
  it "health should decrease by 10 if 1..2 rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play
    @player.health.should == @initial_health - 10
  end
end