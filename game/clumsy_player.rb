require_relative 'player'

class ClumsyPlayer < Player

  def found_treasure( treasure )
    #This is taking in the treasure created in 'game_turn' module
    # treasure_points = treasure.point / 2
    # @found_treasure[treasure.name] += treasure_points
    # puts "#{@name}'s Treasures: #{@found_treasure}"
    treasure = Treasure.new(treasure.name, treasure.point / 2.0)
    super(treasure)
    
  end
end



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