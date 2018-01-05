require './lib/bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if bike_availibility
      raise "No bikes"
    elsif (@bikes[-1].working? == false)
      raise "Bike is broken"
    end
    @bikes.pop
  end

  def dock(bike)
    if full?
       raise "No capacity"
     else
       @bikes << bike
     end
  end

private
  def bike_availibility
    @bikes.empty?
  end

private
  def full?
    @bikes.length >= @capacity
  end

end
