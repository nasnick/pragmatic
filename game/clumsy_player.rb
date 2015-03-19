require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player
    def initialize(name, health=100, boost=1)
      #Boost calls w00t twice 0 and 1
      super(name, health)
      @boost = boost
    end

    def found_treasure( treasure )
      #This is taking in the treasure created in 'game_turn' module
      # treasure_points = treasure.point / 2
      # @found_treasure[treasure.name] += treasure_points
      # puts "#{@name}'s Treasures: #{@found_treasure}"
      treasure = Treasure.new(treasure.name, treasure.point / 2.0)
      super(treasure)
    
      def w00t
        @boost.times { super }
        super
      end
    end
  end
end

# if __FILE__ == $0
#   clumsy = ClumsyPlayer.new('clod', 40)
#   5.times { clumsy.w00t }
#   puts clumsy.health
# end


# if __FILE__ == $0
#   clumsy = ClumsyPlayer.new("klutz", 20)
#
#   hammer = Treasure.new(:hammer, 50)
#   clumsy.found_treasure(hammer)
#   clumsy.found_treasure(hammer)
#   clumsy.found_treasure(hammer)
#
#   crowbar = Treasure.new(:crowbar, 400)
#   clumsy.found_treasure(crowbar)
#
#   clumsy.each_found_treasure do |treasure|
#     puts "#{treasure.point} total #{treasure.name} points"
#   end
#   puts "#{clumsy.points} grand total points"
# end