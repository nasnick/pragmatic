require_relative 'game_turn'
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
    puts "\n"
    
    @players.each do |player|
      GameTurn.take_turn(player)
    end
  end
  
  def add_player( a_player )
    @players << a_player
  end
end