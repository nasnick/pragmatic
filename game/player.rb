require_relative 'treasure_trove'
require_relative 'playable'

class Player
include Playable 
  attr_accessor :health
  attr_accessor :name
  
  def initialize(name, health=100)
    #Values for instance variables are unique for each object.
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end
  
  def to_s
    #Get to the bottom of this method.
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end
  
  def name=(new_name)
    @name = new_name.capitalize
  end
  
  def self.from_csv( line )
    #can create player object in game class but here to create an object of type player, this must be done in the player       class.
    name, health = line.split(',')
    player = Player.new(name, Integer(health))
  end
  
  def <=>(other_player)
     #puts "here's #{other_player.name}'s #{other_player.score}"
     #puts score
     #How does this work again? Comparing each in the array and returning an ordered array based on 'score' so like a custom array sorter. Can change score to name.length and it will sort based on name length.
    other_player.score <=> score
  end
  
  def found_treasure( treasure )
    #new_treasure = TreasureTrove.random << had this here before there was a parameter added and it worked.
    @found_treasure[treasure.name] += treasure.point
    puts "#{@name}'s Treasures: #{@found_treasure}"
  end
  
  def each_found_treasure
    #Accesses the keys and values of the @found_treasure hash.
    @found_treasure.each do |name, point|
      #Creates a new struct contructed from the keys/ values passed from found_treasure. More notes below.
      # treasure = Treasure.new(name, point)
      #yield treasure
      yield Treasure.new(name, point)
    end
  end
  
  def points
    #what does the '0' do here?
    #This is per player. To sum all points from treasures found. Method in Game class sums them up for each round.
    @found_treasure.values.reduce(0,:+)
  end
  
  def score
    #points is what's returned from the points method.
      @health + points
  end
end

if __FILE__ == $0
  player1 = Player.new("moe")
  puts player1.name
end

#calling the points method on the player object within the player class?

#treasure = Treasure.new(name, points) can be called in this class but if put in w00t this is the result:
#<struct Treasure name="Larry", points=480>
#How is Treasure accessible in this class?