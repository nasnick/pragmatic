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
      player.w00t
      player.blam
      player.blam
      puts player
    end
  end
  
  def add_player( a_player )
    @players << a_player
  end
end

