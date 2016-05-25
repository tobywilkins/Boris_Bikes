require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    raise "No bikes available" unless @bike
    @bike
  end 

  def dock(bike)
  	if @bike
  		raise "Docking station is full"
  	else
  		@bike = bike
  	end
  end

end




# docking_station = DockingStation.new
# => #<DockingStation:0x007fb9ca256ee0>
# [4] pry(main)> bike = Bike.new
# => #<Bike:0x007fb9caa1a8c0>
# [5] pry(main)> docking_station.dock(bike)
# => #<Bike:0x007fb9caa1a8c0>
# [6] pry(main)> docking_station.dock(bike)
# Error: no bikes available