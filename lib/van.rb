require './lib/docking_station.rb'

class Van
  attr_reader :trailer

  def initialize
    @trailer = []
  end

  def collect(bike)
    @trailer << bike
  end

  def pickup_from_station(docking_station)
    docking_station.bikes.map! {|bike|
      if bike.working? == false
        collect(bike)
      end}
  end

end

docking_station = DockingStation.new
van = Van.new
bike1 = Bike.new
bike1.report_broken
bike2 = Bike.new
docking_station.dock(bike1)
docking_station.dock(bike2)
