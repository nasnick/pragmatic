require_relative 'player'
require_relative 'game_turn'

#Game class inherits from player class.

class Game
  attr_reader :title, :rounds
  
  def initialize(title)
    @title = title
    @players = []
  end 
  
  def play(rounds)
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
     
    1.upto(rounds) do |round|
      puts "Round #{round}:"
      @players.each do |player|
        #if I add 'player.name = "rogeyboy"'here it shows that it's possible to change the value of an instance variables (@name)          via the symbol :name in the player class via attr_accessor but if this is defined in attr_reader an error is thrown.
        
        #This takes 'player and then passes it to the module method 'take_turn' so these block (what are they called) can be               passed around to different classes and modules.
        
        GameTurn.take_turn(player)
        GameTurn.assign_treasure(player)
        
      end
      puts "\n"
      #print_stats << a call to print_stats here works but is now defined in studio_game
   end
 end
 
   def total_points
     @players.reduce(0) {|sum, player| sum += player.points}
   end
 
 def print_name_and_health(player)
   puts "#{player.name} (#{player.score}) "
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
   puts "#{@title} High Scores:"
   @players.sort.each do |player|
     puts "#{player.name.ljust(20, '.')} #{player.score}"
     end
     
     @players.each do |player|
       puts "\n#{player.name}'s points total:"
       player.each_treasure do |treasure|
         puts "#{treasure.points} points from #{treasure.name}s"
       end
       puts "#{player.points} grand total points"
     end
     puts "\n#{total_points} total treasure points found during the game." 
  end
  
 def add_player( a_player )
    @players << a_player
  end
 end