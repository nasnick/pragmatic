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
      #puts @players.sort.reverse
      puts "\n"
      #print_stats
   end
 end
 
 def print_name_and_health(player)
   puts "#{player.name} (#{player.health}) "
 end
 
  def print_stats
   strong, wimpy = @players.partition { |strong| strong.strong? }
   
   puts "\n#{@title} Statistics:"
   puts "#{strong.size} strong players:"
  
   strong.each do |player|
     print_name_and_health(player)
   end
   puts "\n#{wimpy.size} wimpy players:"
   
   wimpy.each do |player|
     print_name_and_health(player)
   end
   puts "\n"
   #sorted_players = @players.sort {|a,b| a <=> b }
   puts "#{@title} High Scores:"
   #sorted_players.each do |player|
   @players.sort.each do |player|
     #dot = "." * (15 - player.name.length)
     puts "#{player.name.ljust(20, '.')} #{player.score}"
     end
   end   
  
 def add_player( a_player )
    @players << a_player
  end
end
