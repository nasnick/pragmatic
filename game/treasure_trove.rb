#Changed points to point so to differentiate from points method
Treasure = Struct.new(:name, :point)

module TreasureTrove
  TREASURES = [
    Treasure.new(:pie, 5),
    Treasure.new(:bottle, 25),
    Treasure.new(:hammer, 50),
    Treasure.new(:skillet, 100),
    Treasure.new(:broomstick, 200),
    Treasure.new(:crowbar, 400)
    ]
    def self.random
      TREASURES.sample
   end
  end

# treasures = TreasureTrove::TREASURES
# # treasures.random.each do |treasure|
# #   puts treasure
# # 
# puts treasures.random



  # treasure.each do |treasure|
  #   puts treasure.name
  # end