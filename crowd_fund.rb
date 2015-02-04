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
charity1 = Project.new("ABC", 200, 1000)
charity2 = Project.new("DEF", 300, 1000)
charity3 = Project.new("XYZ", 400, 1000)
charity4 = Project.new("PQR", 320, 1000)
# puts charity1
# charity1.sub(40)
# puts charity1
# charity1.add(20)
# puts charity1
# charity1.name = "QWERT"
# puts charity1

projects = [charity1, charity2, charity3]

projects.each do |project|
  puts project
end
puts "\n"
puts projects.select {|a| a.initial_amount < 250 }
puts "\n" 

projects.keep_if {|a| a.initial_amount > 200 }
projects << charity4

projects.each do |project|
  puts project
end