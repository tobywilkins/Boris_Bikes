require_relative 'bike'

class DockingStation

  attr_reader :bike
  def initialize ( bikes = 20 )
  	@bikes = bikes
  end 


  def release_bike
    raise "No bikes available" unless @bike
    @bike
  end 

  def dock(bike)
  	if @bikes >= 20
  		raise "Docking station is full"
  	else
  		@bikes = bike
  	end
  end

end




# [1] pry(main)> require './lib/docking_station'
# => true
# [2] pry(main)> docking_station = DockingStation.new
# => #<DockingStation:0x007fa433224c58>
# [3] pry(main)> bike = Bike.new
# => #<Bike:0x007fa433165268>
# [4] pry(main)> docking_station.dock(bike)
# => RuntimeError: Docking station full
# [5] pry(main)> 21.times {docking_station.release_bike}
# RuntimeError: No bikes available
# from /Users/abdullamahmood/Projects/boris-bikes/lib/docking_station.rb:8:in `release_bike'