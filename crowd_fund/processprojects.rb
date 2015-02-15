require_relative 'project'
require_relative 'funding_round'

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
      FundingRound.project_funding( project )
      puts "\n"
      #a call to project_worthiness to eliminate charities that have dropped below 250
      project_worthiness( project )
  end
  @increment += 1
  summary
end
  
  def project_worthiness( project )
     @projects = @projects.select {|a| a.initial_amount > 250 }
  end
    
  def add_projects( a_project )
    @projects << a_project
    ##NOT NEEDED## call to project_worthiness method to filter out charties below 250
    #@projects.each {|p| project_worthiness(p) }
  end
  
  def summary
    puts "After #{@increment} rounds of funding there are #{@projects.size} projects:"
    @projects.each do |project|
    FundingRound.fully_funded( project )
   end
   puts "\n"
  end
end