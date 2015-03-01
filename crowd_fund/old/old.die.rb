require_relative 'processprojects'

class Die

  def roll
    @die_roll = rand(1..6)
  end
end