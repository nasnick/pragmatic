module Fundable
  def add(second_number)
    @initial_amount += second_number
    puts "Project #{@name} has gained #{second_number}!"
    puts "Project #{@name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
    puts "\n"
  end


  def sub(second_number)
    @initial_amount -= second_number
    puts "Project #{@name} has lost #{second_number}!"
    puts "Project #{@name} needs a further $#{outstanding} to reach their goal of $#{@goal}"
    puts "\n"
 end 
 
 def funding_received( pledge )
   @pledge_totals[pledge.level]+=pledge.funds
   @initial_amount += pledge.funds
   puts "Project #{@name}'s pledges: #{@pledge_totals}"
 end
 
 def funded?
   @initial_amount >= 1000 ? true : false
 end
end