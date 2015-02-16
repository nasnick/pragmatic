require_relative 'game_turn'
require_relative 'player'

#Game class inherits from player class.

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end 
  
  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    puts @players
    puts "\n"
    (rounds).times do |round|
      @players.each do |player|
        puts "#{player.name}'s score in round #{round + 1}"
        GameTurn.take_turn(player)
      end
      puts @players.sort.reverse
      puts "\n"
   end
 end
  
  def add_player( a_player )
    @players << a_player
  end
end