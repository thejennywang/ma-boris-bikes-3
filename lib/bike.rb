class Bike

	def initialize
		@broken = false
	end

	def broken?
		@broken
	end

	def working?
		!broken?
	end

	def break!
		@broken = true
		self
	end

	def fix!
		@broken = false
		self
	end

end