class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  def initialize capacity = DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
  end

  def release_bike
      raise "Bike not available" if empty? || (working_bikes_count <= 0)
      bike_to_remove = bikes.find{|bike| bike.broken? == false}
      bikes.delete(bike_to_remove)
  end

  def dock(bike)
    raise("Docking capacity reached") if full?
    bikes << bike
  end

private

  attr_reader :bikes

  def working_bikes_count
    bikes.count - broken_bikes_count
  end

  def broken_bikes_count
    bikes.select{|bike| bike.broken?}.count
  end

  def empty?
    bikes.count <= 0
  end

  def full?
    bikes.count >= @capacity
  end
end
