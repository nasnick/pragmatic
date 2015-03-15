require_relative 'player'
require_relative 'game'

class BerserkPlayer < Player
  def initialize(name, health=100)
    super(name, health)
    @w00t_count = 0
  end
  
  def berserk?
    @w00t_count > 5
  end
  
  def w00t
    super
    @w00t_count += 1
    unless berserk? == false then
       puts "#{name} is berserk!"
    end
    
    def blam
      super
      unless berserk? == false then
        #berserk? ? w00t : super
         puts "Berserker was BLAMMED but he is berserk so will be w00ted"
         w00t
      end
    end
  end
end


if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.w00t }
end




# Roger = BerserkPlayer.new("roger", 20)
# Peter = Player.new("salmon", 40)
# Roger.w00t
# Roger.w00t
# Roger.w00t
# Roger.w00t
# Roger.w00t
# puts Roger.health
# puts Roger.points
# Rog = Game.new("Rog")
# Rog.add_player(Roger)
# Rog.add_player(Peter)
# Rog.play(4)
# Rog.print_stats
# puts Rog.inspect