require_relative 'treasure_trove'

class Player
  attr_reader :health
  attr_accessor :name
  
  def initialize(name, health=100)
    #Values for instance variables are unique for each object.
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"
  end
  
  def <=>(other_player)
     #puts "here's #{other_player.name}'s #{other_player.score}"
     #puts score
    other_player.score <=> score
  end
  
  def found_treasure(treasure)
    #new_treasure = TreasureTrove.random << had this here before there was a parameter added and it worked.
    @found_treasure[treasure.name] += treasure.points
    puts "#{@player} found a #{treasure.name} worth #{treasure.points} points"
    puts @found_treasure
    #@found_treasures.values.reduce(0,:+)
    #puts "#{@name}'s Treasures: @found_treasures"
  end
  
  def points
    #what does the '0' do here?
    @found_treasure.values.reduce(0,:+)
  end
  
  
  def strong?
    health >= 135 ? true : false
  #   if @health >= 150
  #     true
  #   elsif @health < 100
  #     false
  # end
end
  
  def name=(new_name)
    @name = new_name.capitalize
  end

    def score
      @health + @name.length
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

if __FILE__ == $0
  player1 = Player.new("moe")
  puts player1.name
end