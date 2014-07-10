require 'van'

describe Van do
	
	it_behaves_like 'a bike container'

	let (:van) { Van.new(capacity:20) }
	let (:working_bike) {double :bike, working?: true, broken?: false}
	let (:broken_bike) {double :bike, working?: false, broken?: true}
	let (:garage) {double :garage, bikes: [working_bike], release: nil}
	let (:station) {double :old_street, bikes: [working_bike, broken_bike], release: broken_bike} 


	it 'picks up broken bikes from station' do
		van.pick_up_broken_bikes_from(station)
		expect(van.bikes).to eq [broken_bike]
	end

	it 'releases broken bikes from station' do
		expect(station).to receive(:release).with(broken_bike)
		van.pick_up_broken_bikes_from(station)
	end

	it 'pick up working bikes from garage' do
		van.pick_up_working_bikes_from(garage)
		expect(van.bikes).to eq [working_bike]
	end

		it 'releases working bikes from garage' do
		expect(garage).to receive(:release).with(working_bike)
		van.pick_up_working_bikes_from(garage)
	end


end