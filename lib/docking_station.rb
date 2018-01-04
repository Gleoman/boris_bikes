require './lib/bike'
class DockingStation
  attr_reader :bikes, :capacity

  def initialize(capacity = 1)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
     if @bikes.empty?
       raise "No bikes"
     else
       @bikes.pop
     end
  end

  def dock
    if @bikes.length < @capacity
      @bikes << Bike.new
    else
      raise "No capacity"
    end
  end
end
