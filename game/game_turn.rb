#require_relative 'player'
require_relative 'die'
require_relative 'game'

module GameTurn

  def self.number_rolled
    die = Die.new
    number_rolled = die.roll
  end
  
  def self.take_turn( player )
    round = 1
    case number_rolled
    when 1..2
      player.blam
    when 5..6
      player.w00t
    else
     puts "#{player.name} was skipped" 
    end
    puts "#{player.name} now has a health of #{player.health} and a score of #{player.score}"
    puts "\n"
  end
end

