require_relative 'die'

module StudioGame
  module GameTurn

    def self.number_rolled
      die = Die.new
      number_rolled = die.roll
    end
  
    def self.assign_treasure( player )
      # Call made to this in play method of the game class (GameTurn.assign_treasure(player)). 
      #Player object comes from block iterating through player array.
      #This assigns a treasure from TreasureTrove class.
      treasure = TreasureTrove.random
      #found_treasure adds the treasure to the hash and adds the points of each treasure up.
      player.found_treasure( treasure )
      puts "#{player.name} found a #{treasure.name} worth #{treasure.point} points"
      puts player
      puts "\n"
    end
  
    def self.take_turn( player )
      #W00t or blam a player
      case number_rolled
      when 1..2
        player.blam
      when 5..6
        player.w00t
      else
       puts "#{player.name} was skipped" 
      end
    end
  end
end

#play method (Game class) => (assign_treasure method (game_turn module) <= treasure_trove) =>  found_treasure (player class) => called in print_stats method (Game class)