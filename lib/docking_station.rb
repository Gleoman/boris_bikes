require './lib/bike'
class DockingStation
  attr_reader :bike

  def initialize()
    @bike = []
  end

  def release_bike
     if @bike.empty?
       raise "ArgumentError"
     else
       @bike.pop
     end
  end

  def dock(bike)
    @bike << bike
  end

end
