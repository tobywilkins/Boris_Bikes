class Van
	attr_reader :bikes
	def initialize
		@bikes = []
	end
	def collect_bikes_from_dock(dock)
		@bikes = (dock.release_broken_bikes)
	end
end