require './lib/bike'
class DockingStation
  attr_reader :bike, :capacity

  def initialize(capacity = 1)
    @bike = []
    @capacity = capacity
  end

  def release_bike
     if @bike.empty?
       raise "No bikes"
     else
       @bike.pop
     end
  end

  def dock
    if @bike.length < @capacity
      @bike << Bike.new
    else
      raise "No capacity"
    end
  end
end
