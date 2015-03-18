module Calculatable
  
  def calculate_age
  age = (Time.now - Time.new(@year, @month, @day)) / 60 / 60 / 24 / 365
  puts "#{name} is #{age.to_i} years old"
  how_old = age > 35 ? true : false
    if how_old == true then puts "What an old fart!"
      else
    puts "Still a yungy" 
    end
  end
end