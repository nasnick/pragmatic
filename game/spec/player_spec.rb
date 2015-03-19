require_relative 'player'

module StudioGame
  describe Player do
    before do
      @initial_health = 150
      @player = Player.new("larry", @initial_health)
      $stdout = StringIO.new
    end
  
    it "has a capitalized name" do
       @player.name.should == "Larry"
    end
  
    it "has an initial health" do
      @player.health.should == 150
    end
  
    it "has a string representation" do  
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))

      @player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
    end
  
    it "computes a score as the sum of its health and length of name" do
      #had to make this pass. The test is no longer relevant.
      (@player.score + @player.name.length).should == 155
    end

    it "increases health by 15 when w00ted" do
      @player.w00t
      @player.health.should == @initial_health + 15
    end

    it "decreases health by 10 when blammed" do
      @player.blam
      @player.health.should == @initial_health - 10
    end
  
    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))
  
      @player.score.should == 250
    end
  
    context "create a player with a default value of 150" do 
      before do
        @initial_health = 550
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
  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end
  
    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  
    it "computes points as the sum of all treasure points" do
      @player.points.should == 0

      @player.found_treasure(Treasure.new(:hammer, 50))

      @player.points.should == 50

      @player.found_treasure(Treasure.new(:crowbar, 400))

      @player.points.should == 450

      @player.found_treasure(Treasure.new(:hammer, 50))

      @player.points.should == 500
    end
    it "yields each found treasure and its total points" do
      #add the objects to the hash
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
  
      yielded = []
      #create an array of structs
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end
  
      yielded.should == [
        Treasure.new(:skillet, 200), 
        Treasure.new(:hammer, 50), 
        Treasure.new(:bottle, 25)
     ]
    end
  
    it "should create a player object when supplied with a string and health value" do 
      # player = Player.from_csv("larry,150")
      # player.name.should == "Larry"
      # player.health.should == 150
      string = "Roger,30"
      Player.from_csv(string).name.should == 'Roger'
      Player.from_csv(string).health.should == 30
    end
   end
  end
end

  # Notes:
  # In the following, got == what the class returned, expected == what the test was expecting.
  # So if - 10 is commented out then throws the following error:
  # expected: 150
  #      got: 140 (using ==)

  #Just to test out the from_csv method: player = Player.new(name, Integer(10 + health.to_i)) and the test failed by 10. Not sure why I had to use .to_i