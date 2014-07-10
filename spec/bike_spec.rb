require 'bike'

describe Bike do

	let(:topsy) { Bike.new }

	it 'should not be broken when we create it' do
		expect(topsy).not_to be_broken
	end

	it 'should be able to break' do
		topsy.break!
		expect(topsy).to be_broken
	end

	it "should be fixable" do
		topsy.break!
		topsy.fix!
		expect(topsy).not_to be_broken
	end

end