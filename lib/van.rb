require 'garage'

class Van
	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def collect_bikes_from_dock(dock)
		@bikes = (dock.release_broken_bikes)
	end

  def deliver_bikes_to_garage(garage)
    garage.recieve_bikes(@bikes)
    @bikes = []
  end
end