require_relative 'die'
require_relative 'project'

module FundingRound

def self.die_rolled
  die = Die.new
  die_rolled = die.roll
end

def self.project_funding( project )
  
  case die_rolled % 2 == 0
  when true
    project.add(440)
  else
    project.sub(130)
  end
 end
 
 def self.print_summary_results( project )
   puts "#{project.name} with (#{project.initial_amount})"
 end
 
 def self.fully_funded( project )
      case project.initial_amount >= 1000 ? true : false
     when true
       puts "******* Project #{project.name} has reached its funding amount.********"
     else
       puts "Project #{project.name} still needs $#{project.outstanding} towards its goal of #{project.initial_amount}"
     end
   end
end
