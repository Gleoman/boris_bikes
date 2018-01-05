require 'rspec'
require 'spec_helper'
require 'docking_station'

describe DockingStation do
 it { is_expected.to respond_to :release_bike }
 context '.dock' do
   it 'docks a working bike' do
     docking_station = DockingStation.new
     bike = double(:bike)
     expect(docking_station.dock(bike)).to eq [bike]
   end

   it 'docks a broken bike' do
     bike = double(:bike)
     bike.report_broken
     expect(subject.dock(bike)).to eq [bike]
   end

  context 'when DockingStation initialized with default capacity' do
   it 'does not dock a bike if no capacity' do
    docking_station = DockingStation.new
    (docking_station.bikes << Array.new(docking_station.capacity)).flatten!
    expect{docking_station.dock}.to raise_error
  end
 end

  context 'when DockingStation initialized with non-default capacity' do
    it 'does not dock a bike if no capacity' do
      docking_station = DockingStation.new(30)
      (docking_station.bikes << Array.new(docking_station.capacity)).flatten!
      expect{docking_station.dock}.to raise_error
  end
end

 context '.release_bike' do
   it 'returns error when no bikes available' do
     docking_station = DockingStation.new
     expect{docking_station.release_bike}.to raise_error("No bikes")
   end
 end

 context 'when bike for release is broken' do
   it 'returns error' do
     bike = double(:bike)
     bike.report_broken
     subject.dock(bike)
     expect{subject.release_bike}.to raise_error("Bike is broken")
   end
 end

 it { is_expected.to respond_to(:bikes)}

end
end
