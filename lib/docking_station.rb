require_relative 'bike'

class DockingStation
DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
  	@bikes = []
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
  	raise "Docking station is full" if full?
    @bikes << bike
  end

  private
  def empty?
    @bikes.count <= 0
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
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
