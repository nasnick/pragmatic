require_relative 'car'

#:colour, :condition, :type

describe Car do
  before do
    @car = Car.new("WillVS","silver",4)
  end

    it "should have a a type" do
      @car.type.should == "WillVS"
    end
    
    it "should have a a colour" do
      @car.colour.should == "silver"
    end
    
    it "should have a a condition" do
      @car.condition.should == 4
    end
    
  end

