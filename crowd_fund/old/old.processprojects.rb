require_relative 'project'
require_relative 'funding_round'

class ProcessProjects
  attr_reader :title, :projects
  
  def initialize(title)
    @title = title
    @projects = []
    @increment = 1
  end  
    
  def request_funding(rounds)
    puts "There are #{@projects.size} projects:"
    puts @projects
    puts "\n"
    
    pledges = PledgePool::PLEDGES
    puts "There are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.level} pledge is worth $#{pledge.funds}"
    end
    puts "\n"
    #pledges.each do
    (rounds).times do
      @projects.each do |project|
        FundingRound.assign_funding( project )      
        FundingRound.project_funding( project )
        #a call to project_worthiness to eliminate charities that have dropped below 250
        project_worthiness( project )
    end
    puts "\n*********END OF ROUND #{@increment}*********"
    puts "\n"
    summary
    @increment += 1
  end
end
  
  def project_worthiness( project )
     @projects = @projects.select {|a| a.initial_amount > 250 }
  end
    
  def add_projects( a_project )
    @projects << a_project
    ##NOT NEEDED## call to project_worthiness method to filter out charties below 250
    #@projects.each {|p| project_worthiness(p) }
  end
  
  def print_summary_results( project )
    puts "#{project.name} with (#{project.initial_amount})"
  end
  
  def summary
    funded, not_funded = @projects.partition {|funded, not_funded| funded.initial_amount > 1000}
    puts "#{funded.size} funded projects:"
    funded.sort.each do |project|
      print_summary_results( project )
    end
    puts "\n"
    puts "#{not_funded.size} unfunded projects:"
    not_funded.sort.each do |project|
      print_summary_results( project )
    end
  
    puts "\nAfter #{@increment} rounds of funding there are #{@projects.size} projects:"
    @projects.each do |project|
    FundingRound.fully_funded( project )
    puts "\n"
   end
  end
end