require_relative 'player'


describe Player do
  before do
    @initial_health = 150
    @player = Player.new("rogey", @initial_health)
    $stdout = StringIO.new
  end
  
  it "has a capitalized name" do
     @player.name.should == "Rogey"
  end
  
  it "has an initial health" do
    @player.health.should == 150
  end
  
  it "has a string representation" do
    @player.to_s.should == "I'm Rogey with a health of 150 amd a score of 155"
  end
  
  it "computes a score as the sum of its health and length of name" do
    @player.score.should == 150 + 5
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end
  
  context "create a player with a default value of 150" do 
    before do
      @initial_health = 150
      @player = Player.new("lozzy", @initial_health)
    end
    it "should be strong" do
      @player.should be_strong
    end
    
    context "create a player with a default value of 100" do
      before do
      @initial_health = 100
      @player = Player.new("haydo", @initial_health)
    end
    it "should be wimpy" do
      @player.should_not be_strong
    end
  end
end
end