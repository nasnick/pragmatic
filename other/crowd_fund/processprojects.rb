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