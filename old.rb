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

##############

def current_time
  time = Time.new
  time.strftime("%T")
end

def say_hello(name, health=100)
 puts  "I'm #{name.capitalize} with a health of #{health} as of #{current_time}"
end

say_hello("larry", 60)
say_hello("curly", 125)
say_hello("moe")
say_hello("shemp", 90)

################
project1="ABC"
project2="LMN"
project3="XYZ"
project1_funding = 1000
project2_funding = 1500
project3_funding = 2000


puts "Project #{project1} has $#{project1_funding} in funding."
puts "Project #{project2} has $#{project2_funding} in funding."
puts "Project #{project3} has $#{project3_funding} in funding."
puts "\n"

puts "Projects:\n\tProject #{project1}\n\tProject #{project2}\n\tProject #{project3}"

