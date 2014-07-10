
class Van

	include BikeContainer

	def initialize(options)
		@capacity = options[:capacity] || DEFAULT_CAPACITY
	end

	def pick_up_broken_bikes_from(station)
		pick_up_bikes from: station, which_are: :broken?
	end

	def pick_up_working_bikes_from(garage)
		pick_up_bikes from: garage, which_are: :working?
	end

	private

	def pick_up_bikes from: place, which_are: :working?
		from.bikes.each { |bike| dock(from.release(bike)) if bike.send(which_are) }
	end

end
