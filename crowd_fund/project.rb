class Project
  attr_accessor :name
  attr_reader :initial_amount, :second_number, :goal
  
  def initialize(name, initial_amount, goal)
    @name = name
    @initial_amount = initial_amount
    @goal = goal
    @second_number = second_number
  end
  
    def to_s
      "Project #{@name} has $#{@initial_amount} in funding towards a goal of $#{@goal}"
    end
    
    def outstanding
      outstanding = @goal - @initial_amount
    end
    
    #def add(second_number)
      #@initial_amount += second_number
    def add
      puts "Project #{@name} has gained $25!"
      @initial_amount += 25
      puts "Project #{name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
    end
    
    #def sub(second_number)
      #@initial_amount -= second_number
    def sub
      puts "Project #{@name} has lost $15!"
      @initial_amount -= 15
      puts "Project #{@name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
   end  
end