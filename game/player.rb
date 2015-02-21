class Player
  attr_reader :health
  attr_accessor :name
  
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def <=>(other_player)
     #puts "here's #{other_player.name}'s #{other_player.score}"
     #puts score
    other_player.score <=> score
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}"
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