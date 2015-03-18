module Playable
  
  def blam
    health -= 10
    puts "#{name} got blammed!"
  end

  def w00t
    health += 15
    puts "#{name} got w00ted!"
  end
  
  def strong?
    (health + points) >= 500 ? true : false
  end
end

#To change @health (instance variable) to health, @health in the Player class needed to be made read/ write.
#Above is a health attribute, rather than the @health instance. 