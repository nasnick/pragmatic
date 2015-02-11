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
    puts "\n"
    
    @players.each do |player|
      die = Die.new
      number_rolled = die.roll
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
  
  def add_player( a_player )
    @players << a_player
  end
end

