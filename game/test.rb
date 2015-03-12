require 'csv'
CSV.foreach('/Users/nickschofield/studio_game/game/players.csv') do |row|
  name, health = row
  puts "#{name.inspect} #{health.inspect}"
end