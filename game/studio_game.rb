require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

#knuckleheads represents a new game - player objects are called above and are created in/ are objects of the player class. The add_player method in the game class then adds them to an array and the play method gets the game rollin. 

#The player class defines and holds the state of the player objects (with name and health defined) and this class has methods that can w00t or blam the players. Still think that those methods belong in the game class.

knuckleheads = Game.new("Knuckleheads")
#add_player calls a method in game which is added to instance array @players. The player object created in the player class is avaible in the game class. Require_relative 'player' needed in Game class for this to happen. There is a call to game_turn module in Game class and in game_turn module there are calls back to the methods in the Player class.
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(5)
knuckleheads.print_stats


# Treasure.new(:pie, 5),
# Treasure.new(:bottle, 25),
# Treasure.new(:hammer, 50),
# Treasure.new(:skillet, 100),
# Treasure.new(:broomstick, 200),
# Treasure.new(:crowbar, 400)
