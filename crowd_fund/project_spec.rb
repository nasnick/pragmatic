require_relative 'project'
require_relative 'die'

describe Project do
  before do
    $stdout = StringIO.new
    @initial = 200
    @goal = 1000
    @project = Project.new("ABC", @initial, @goal)
    
  end 
 
    it "has an initial target funding amount" do
      @project.goal.should == 1000
    end

    it  "computes the total funding outstanding as the target funding amount minus the funding amount" do
      @project.outstanding.should == @goal - @initial
    end

    it "increases funds by 40 when funds are added" do
      Die.any_instance.stub(:roll).and_return(2)
      @project.add(40)
      @project.initial_amount.should == @initial + 40
    end
    
    it "decreases funds by 30 when funds are removed" do
      Die.any_instance.stub(:roll).and_return(1)
      @project.sub(30)
      @project.initial_amount.should == @initial - 30
    end

    it "has a default value of 0 for funding amount" do
      @project.initial_amount.should == 200
    end
    
    
    context "should test whether the project has reached its funding amount" do
      before do
        @initial = 1000
        @goal = 1000
        @project = Project.new("PQR", @initial, @goal)
      end
      it "should return true" do
      @project.should be_funded
    end
  end


    context "should test whether the project hasn't reached its funding amount" do
      before do
        @initial = 200
        @goal = 1000
        @project = Project.new("LMN", @initial, @goal)
      end
      it "should return false" do
      @project.should_not be_funded
    end
  end
end
    