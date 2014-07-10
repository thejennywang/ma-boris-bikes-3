require './lib/bike_container'

shared_examples 'a bike container' do

	let (:container) {described_class.new(capacity:20)}

	let(:topsy) { double :bike, fix!: :bike, broken?: false}
	let(:turvy) { double :bike, break!: :bike, broken?: true}

	def fill_station(station)
		station.capacity.times { station.dock(topsy) }
	end

	it 'should accept a bike' do
		expect(container.bike_count).to eq(0)
		container.dock(topsy)
		expect(container.bike_count).to eq(1)
	end

	it 'should release a bike' do
		container.dock(topsy)
		container.release(topsy)
		expect(container.bike_count).to eq(0)
	end

	it 'should know when it is full' do
		expect(container).not_to be_full
		fill_station(container)
		expect(container).to be_full
	end

	it 'should not accept a bike if at capacity' do
		fill_station(container)
		expect(lambda {container.dock(topsy)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of avaliable bikes' do
		container.dock(topsy)
		container.dock(turvy)
		expect(container.available_bikes).to eq([topsy])
	end

	it 'should not release a bike if there are no bikes to release' do
		expect{container.release(topsy)}.to raise_error(RuntimeError)
	end

end