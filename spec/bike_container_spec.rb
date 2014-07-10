require 'docking_station'
require 'bike_container'

describe DockingStation do

	let (:bike) { double :bike }
	let (:old_street) { DockingStation.new }
	let (:moorgate) {DockingStation.new(:capacity => 30)}
	let (:moorgate) { DockingStation.new(:capacity => 123) }

	it 'has no bikes when created' do
		expect(old_street.bikes).to eq []
	end
	
	it 'should allow setting capacity on initialising each docking_station' do
		expect(moorgate.capacity).to eq(123)
	end

	it 'should know if its capacity is not using the DEFAULT_CAPACITY' do
		BikeContainer::DEFAULT_CAPACITY.times {moorgate.dock(Bike.new)}
		expect(moorgate.full?).to be false  
	end

	it 'should allow setting capacity on initialising each docking_station' do
		expect(moorgate.capacity).to eq(123)
		moorgate.capacity.times {moorgate.dock(Bike.new)}
	end

end