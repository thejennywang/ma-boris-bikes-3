require 'docking_station'
require 'bike_container'

describe DockingStation do

	let (:bike) { double :bike }
	let (:old_street) { DockingStation.new }
	let (:moorgate) {DockingStation.new(:capacity => 30)}

	it 'has no bikes when created' do
		expect(old_street.bikes).to eq []
	end

	it 'should allow setting capacity on initialising each docking_station' do
		expect(moorgate.capacity).to eq(30)
	end

	it 'should know if its capacity is not using the DEFAULT_CAPACITY' do
		BikeContainer::DEFAULT_CAPACITY.times {moorgate.dock(bike)}
		expect(moorgate.full?).to be false  
	end

	it 'should allow setting capacity on initialising each docking_station' do
		expect(moorgate.capacity).to eq(30)
		moorgate.capacity.times {moorgate.dock(bike)}
	end

end