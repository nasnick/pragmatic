# def conversation
#   puts "hello"
#   yield
#   puts "Goodbye"
# end
#
# conversation { puts "Good to meet you!" }

def five_times(number)
  1.upto(number) do |round|
   yield round
   puts "\n"
 end
end

five_times(10) do |n| 
  puts "#{n} situps" 
  puts "#{n} pushups" 
  puts "#{n} chinups" 
end

# 1 situps
# 1 pushups
# 1 chinups
# ...
# 5 situps
# 5 pushups
# 5 chinups