require_relative 'fundable'

class Project
  include Fundable
  attr_accessor :name
  attr_reader :initial_amount, :goal

  def initialize(name, initial_amount, goal)
    @name = name
    @initial_amount = initial_amount
    @goal = goal
    #@second_number = second_number
    @pledge_totals = Hash.new(0)
  end
  
  def <=>(other_project)
    other_project.initial_amount <=> initial_amount
  end

  def to_s
      "Project #{@name} has $#{@initial_amount} in funding towards a goal of $#{@goal}"
  end
  
  def outstanding
    outstanding = @goal - @initial_amount
  end
  
  def points
    @pledge_totals.values.reduce(0,:+)
  end
  
  def each_pledge_total
    @pledge_totals.each do |level, funds|
     new_pledge = Pledge.new(level, funds)
     yield new_pledge
    end
  end 
end