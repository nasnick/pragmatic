require_relative 'Die'
require_relative 'player'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end 
  
  def play
    puts "There are #{@players.size} players in #{@title}:"
    puts @players
    
    @players.each do |player|
      die = Die.new
      number_rolled = die.roll
      if new_roll >= 5
        player.w00t
      elsif new_roll <= 2
        player.blam
      else
        puts "#{player} stays the same"
        end
    end
  end
  
  def add_player( a_player )
    @players << a_player
  end
end

