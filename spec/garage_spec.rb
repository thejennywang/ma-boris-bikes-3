require 'garage'

describe Garage do
	
	it_behaves_like 'a bike container'

	let(:bike) { double :bike, broken?: false, break!: :bike, dock: :bike, fix!: :bike}
	let(:garage) { Garage.new }

	it 'can be initialized with a capacity other than the default' do
		garage = Garage.new(capacity: 500)
		expect(garage.capacity).to eq(500)
	end

	it 'should accept and fix a bike' do
		bike.break!
		garage.accept_and_fix_bike(bike)
		expect(bike.broken?).to be false
	end

end