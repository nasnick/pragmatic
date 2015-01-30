name1 = "larry"
name2 = "curly"
name3 = "moe"
name4 = "shemp"

health1 = 60
health2 = 125
health3 = 100
health4 = 90

puts "#{name1.capitalize} has a health of #{health1}"
puts "#{name2.upcase} has a health of #{health2}"
name3_sentence = "#{name3.upcase} has a health of #{health3}"
puts name3_sentence.center(48, '*')
puts "#{name4.capitalize.ljust(20, '.')} #{health4} health"
puts "\n"

puts "Players:\n\t#{name1}\n\t#{name2}\n\t#{name3}"
puts "\n"

health2 = health1

# current_time = Time.new
# formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")
# puts "The game started on #{formatted_time}"

day_date_time = Time.new.strftime("The game started on %A %D at %I:%M%p")
puts "#{day_date_time}"
