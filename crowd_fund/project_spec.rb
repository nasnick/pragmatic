require_relative "project"

describe Project do
  before do
    @initial = 0
    @goal = 1000
    @project = Project.new("ABC", @initial, @goal)
    $stdout = StringIO.new
  end
 
    it "has an initial target funding amount" do
      @project.goal.should == 1000
    end

    it  "computes the total funding outstanding as the target funding amount minus the funding amount" do
      @project.outstanding.should == @goal - @initial
    end

    it "increases funds by 25 when funds are added" do
      @project.add
      @project.initial_amount.should == @initial + 25
    end
    
    it "decreases funds by 15 when funds are removed" do
      @project.sub
      @project.initial_amount.should == @initial - 15
    end

      
    it "has a default value of 0 for funding amount" do
      @project.initial_amount.should == 0
    end

end