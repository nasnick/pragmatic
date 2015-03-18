require "csv"

class Car
  attr_reader :colour, :condition, :type
  def initialize(type, colour, condition)
    @type = type
    @colour = colour
    @condition = condition
  end
  
  def to_s
    puts "This is a #{@colour} #{@type} that is in #{@condition} conditon."
  end
  
  def old?
    @condition < 5
  end
end


class CarLife
  def initialize(title)
    @title = title
    @cars = []
  end
  
  def sell_cars
    time = Time.now
    #time = -> { Time.now }
    old_car, new_car = @cars.partition {|old_car| old_car.old? }
    old_car.each do |car|
      puts "The #{car.type} is being sold because its has a conditon of #{car.condition} as of #{time}"
      @cars.delete(car)
    end
    puts @cars.size
  end
  
  def from_csv(file)
    CSV.foreach(file) do |car|
      type, colour, condition = car
      add_car(Car.new(type, colour, Integer(condition)))
    end
  end
  
  def add_car(a_car)
    @cars << a_car
  end  
end

if __FILE__ == $0
  carlife = CarLife.new("carlife")
  carlife.from_csv(ARGV.shift || "/Users/nickschofield/studio_game/other/Cars/cars.csv")
  carlife.sell_cars
end