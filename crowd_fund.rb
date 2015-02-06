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



class ProcessProjects
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end
  
  def request_funding
    puts "there are #{@projects.size} projects:"
    puts @projects
    puts "\n"
    
    @projects.each do |project|
      project.add(45)
      project.sub(100)
      puts "\n"
      @projects = project_worthiness( project )
    end
    puts "there are #{@projects.size} projects:"
    puts @projects
  end
  
  def project_worthiness( project )
     @projects = @projects.select {|a| a.initial_amount > 250 }
  end
    
  def add_projects(a_project)
    @projects << a_project
    project = @projects.each {|p| project_worthiness(p) }
  end
  
end
    
charity1 = Project.new("ABC", 200, 1000)
charity2 = Project.new("DEF", 300, 1000)
charity3 = Project.new("XYZ", 400, 1000)
charity4 = Project.new("PQR", 320, 1000)

display = ProcessProjects.new("display")
display.add_projects(charity1)
display.add_projects(charity2)
display.add_projects(charity3)
display.add_projects(charity4)
display.request_funding
display.request_funding



why wont this save?