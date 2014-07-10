require_relative 'bike_container'
require_relative 'bike'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def accept_and_fix_bike(bike)
		bike.fix!
		dock(bike)
	end

end