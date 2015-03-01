class Project
  attr_accessor :name
  attr_reader :initial_amount, :second_number, :goal

  def initialize(name, initial_amount, goal)
    @name = name
    @initial_amount = initial_amount
    @goal = goal
    @second_number = second_number
    @pledge_totals = Hash.new(0)
  end
  
  def <=>(other_project)
    other_project.initial_amount <=> initial_amount
  end

  def to_s
      "Project #{@name} has $#{@initial_amount} in funding towards a goal of $#{@goal}"
  end
  
  def funded?
    @initial_amount >= 1000 ? true : false
  end
  
  def outstanding
    outstanding = @goal - @initial_amount
  end
  
  def funding_received( pledge )
    @pledge_totals[pledge.level]+=pledge.funds
    @initial_amount += pledge.funds
    puts "Project #{@name}'s pledges: #{@pledge_totals}"
  end
  
  # def funding_total
  #   @pledge_totals.values.reduce(0,:+)
  # end

  def add(second_number)
    @initial_amount += second_number
    puts "Project #{@name} has gained #{second_number}!"
    #pledge = PledgePool.random
    #puts "Project #{@name} has received a #{pledge.level} worth $#{pledge.funds}"
    puts "Project #{@name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
    puts "\n"
  end


  def sub(second_number)
    @initial_amount -= second_number
    puts "Project #{@name} has lost #{second_number}!"
    #pledge = PledgePool.random
    #@initial_amount += pledge.funds
    #puts "Project #{@name} has received a #{pledge.level} worth $#{pledge.funds}"
    puts "Project #{@name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
    puts "\n"
 end  
end