class DockingStation
  attr_reader :bike
  def initialize
    @bike = nil
  end

  def release_bike
    if @bike == nil
     raise "Bike not available"
     else
     return @bike
     @bike = nil
     end
  end

  def dock(bike)
    @bike = bike
  end

end