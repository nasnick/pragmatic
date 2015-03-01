require_relative 'die'
require_relative 'treasure_trove'

module GameTurn

  def self.number_rolled
    die = Die.new
    number_rolled = die.roll
  end
  
  def self.assign_treasure( player )
    #Assign a treasure to a player object
    treasure = TreasureTrove.random
    player.found_treasure( treasure )
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points"
    #puts "#{player.name} has #{player.points + player.score} points"
    puts player
    puts "\n"
  end
  
  def self.take_turn( player )
    #W00t or blam a player
    round = 1
    case number_rolled
    when 1..2
      player.blam
    when 5..6
      player.w00t
    else
     puts "#{player.name} was skipped" 
    end
    #puts "#{player.name} now has a health of #{player.health} and a score of #{player.score}"
  end
end

