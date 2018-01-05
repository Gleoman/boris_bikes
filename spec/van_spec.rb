require 'rspec'
require 'spec_helper'
require 'van'

describe Van do
  context 'van collects bikes' do
    it 'collects a bike' do
      bike = Bike.new
      subject.collect(bike)
      expect(subject.trailer).to eq [bike]
    end

    it 'collects only broken bikes from station' do
      docking_station = DockingStation.new
      bike1 = Bike.new
      bike1.report_broken
      bike2 = Bike.new
      docking_station.dock(bike1)
      docking_station.dock(bike2)
      subject.pickup_from_station(docking_station)
      expect(subject.trailer).to eq [bike1]
    end

  end
end
