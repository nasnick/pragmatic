Pledge = Struct.new(:level, :funds)

module PledgePool
  PLEDGES = [
    #instances of the Struct so need to be Pledge.new
    Pledge.new(:silver, 50),
    Pledge.new(:bronze, 75),
    Pledge.new(:gold, 100)
  ]
  def self.random
    PLEDGES.sample
  end
end