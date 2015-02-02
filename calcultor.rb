class Calculator
  def initialize(number=0, second_number=0)
    @number = number
    @second_number = second_number
  end
  def add
    @number + @second_number
  end
  def sub
    @number - @second_number
  end
  def mult
    @number * @second_number
  end
end
calc = Calculator.new(20, 11)
puts calc.add
puts calc.sub