require './lib/bike'
class DockingStation
  attr_reader :bikes, :capacity

  def initialize(capacity = 1)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
     if bike_availibility
        raise "No bikes"
      else
        @bikes.pop
      end
  end

  def dock
    if full?
       raise "No capacity"
     else
       @bikes << Bike.new
     end
  end

private
  def bike_availibility
    @bike.empty?
  end

private
  def full?
    @bikes.length >= @capacity
  end

end
