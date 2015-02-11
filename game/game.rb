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
      new_roll = die.roll
      if new_roll < 5
        puts "#{player} stays the same"
      else
        player.w00t
      end
    end
  end
  
  def add_player( a_player )
    @players << a_player
  end
end

