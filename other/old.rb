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

################

# # puts player2.name = "lawrence"
# # puts player2
#
#
# players = [player1, player2, player3]
#
# # puts "There are #{players.size} players in the game."
# players.pop(1)
# players.push(player4)
#
# players.each do |player|
#   player.w00t
#   player.blam
#   player.w00t
#   puts player
# end

###################

require_relative 'project'

class ProcessProjects
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
    @increment = 1
  end
  
  def request_funding
    puts "There are #{@projects.size} projects:"
    puts @projects
    puts "\n"
    
    @projects.each do |project|
      project.add(45)
      project.sub(100)
      puts "\n"
      #a call to project_worthiness to eliminate charities that have dropped below 250
      @projects = project_worthiness( project )
    end
    puts "After #{@increment} rounds of funding there are #{@projects.size} projects:"
    puts @projects
    @increment += 1
    puts "\n"
  end
  
  def project_worthiness( project )
     @projects = @projects.select {|a| a.initial_amount > 250 }
  end
    
  def add_projects( a_project )
    @projects << a_project
    #call to project_worthiness method to filter out charties below 250
    project = @projects.each {|p| project_worthiness(p) }
  end
end

#################

class Project
  attr_accessor :name
  attr_reader :initial_amount, :second_number
  
  def initialize(name, initial_amount=0, goal=0)
    @name = name
    @initial_amount = initial_amount
    @goal = goal
    @second_number = second_number
  end
  
    def to_s
      "Project #{@name} has $#{@initial_amount} in funding towards a goal of $#{@goal}"
    end
    
    def add(second_number)
      puts "Project #{@name} has gained $#{second_number}!"
      @initial_amount += second_number
    end
    
    def sub(second_number)
      puts "Project #{@name} has lost $#{second_number}!"
      @initial_amount -= second_number
   end  
end