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