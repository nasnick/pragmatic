require_relative 'calculatable'

class Person
include Calculatable
attr_reader :year, :month, :day, :name
def initialize(name, year, month, day, height, nose="cute")
@name = name
@year = year
@month = month
@day = day
@height = height
@nose = nose
@time = Time.now
end

def age
  calculate_age
 end
end


Nick = Person.new("Nick", 1977, 02, 25, 182, "ugly")
Tan = Person.new("Tan", 1984, 8, 17, 172, "Cute")
puts Nick.inspect
Nick.age
Tan.age
