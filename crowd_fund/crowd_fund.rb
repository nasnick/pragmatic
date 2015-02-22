require_relative 'processprojects'

charity1 = Project.new("ABC", 250, 1000)
charity2 = Project.new("DEF", 300, 1000)
charity3 = Project.new("XYZ", 400, 1000)
charity4 = Project.new("PQR", 320, 1000)

projects = ProcessProjects.new("VC-Friendly Start-up Projects")
a = "*" * projects.title.length
puts a 
puts projects.title
puts a
projects.add_projects(charity1)
projects.add_projects(charity2)
projects.add_projects(charity3)
projects.request_funding(1)

 
#Will use the values after 'projects' has finished with objecte
# display = ProcessProjects.new("display")
# puts display.title
# display.add_projects(charity1)
# display.add_projects(charity2)
# display.add_projects(charity3)
# display.add_projects(charity4)
# display.request_funding



