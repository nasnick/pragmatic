require_relative 'project'
require_relative 'die'
require_relative 'processprojects'

class ProcessProjects
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
    @increment = 1
  end
  
  def fully_funded
    @projects.each do |project|
       case project.initial_amount >= 1000 ? false : true
      when true
        puts "******* Project #{project.name} has reached its funding amount.********"
      else
        puts "Project #{project.name} still needs $#{1000 - project.initial_amount}"
      end
    end
  end  
    
  def request_funding
    puts "There are #{@projects.size} projects:"
    puts @projects
    puts "\n"
    
    @projects.each do |project|      
      die = Die.new
      die_rolled = die.roll

      case die_rolled % 2 == 0
      when true
        project.add(240)
      else
        project.sub(30)
    end
    
      puts "\n"
      #a call to project_worthiness to eliminate charities that have dropped below 250
      @projects = project_worthiness( project )
  end
    puts "After #{@increment} rounds of funding there are #{@projects.size} projects:"
    fully_funded
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