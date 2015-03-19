require_relative 'game'
require_relative 'auditable'

module StudioGame
  class Die
    include Auditable
    attr_reader :number
  
    def roll
      @number = rand(1..6)
      audit
      return @number
    end
  end
end