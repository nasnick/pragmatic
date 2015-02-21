require_relative 'game_turn'
require_relative 'player'
require_relative "treasure_trove"

#Game class inherits from player class.

class Game
  attr_reader :title, :rounds
  
  def initialize(title)
    @title = title
    @players = []
    @rounds = 1
  end 
  
  def play(rounds)
    round = 0
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end
    
    treasures = TreasureTrove::TREASURES
    puts "\nthere are #{treasures.size} treaures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} worth #{treasure.points} points"
    end
     # a = TreasureTrove.random
     # a.each do |b|
     #   puts b.name
     # end
     # treasure = TreasureTrove.random
     # puts treasure

     puts "\n"
     
    (rounds).times do |round|
      @players.each do |player|
        treasure = TreasureTrove.random
        puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points\n"
        #if I add 'player.name = "rogeyboy"'here it shows that it's possible to change the value of an instance variables (@name)          via the symbol :name in the player class via attr_accessor but if this is defined in attr_reader an error is thrown.
        
        #This takes 'player and then passes it to the module method 'take_turn' so these block (what are they called) can be               passed around to different classes and modules.
        GameTurn.take_turn(player)
        puts "#{player.name}'s round #{rounds} action:"
      end
      #@rounds += 1
      #puts @players.sort.reverse
      puts "\n"
      #print_stats << a call to print_stats here works but is now defined in studio_game
   rounds += 1
   end
   
 end
 
 def print_name_and_health(player)
   puts "#{player.name} (#{player.health}) "
 end
 
  def print_stats
   strong, wimpy = @players.partition { |strong| strong.strong? }
   
   puts "#{@title} Statistics:"
   puts "#{strong.size} strong players:"
  
   strong.sort.each do |player|
     print_name_and_health(player)
   end
   puts "\n#{wimpy.size} wimpy players:"
   
   wimpy.sort.each do |player|
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
