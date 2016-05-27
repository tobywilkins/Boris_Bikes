require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def release_bike
    raise('No bikes available') if empty?
    raise('No bikes available') if working_bike_count == 0
    release_working_bike
  end
  def dock(bike, working=false)
    full? ? raise('Docking station full') : @bikes << bike
    bike.working = working
  end

def release_broken_bikes
sorted = @bikes.partition {|bike| bike.working? == false}
@bikes = sorted[1]
sorted[0]
end

  private

    def full?
      @bikes.length >= @capacity
    end

    def empty?
      @bikes == []
    end

    def working_bike_count
      @bikes.select {|bike| bike.working? == true}.count
    end

    def release_working_bike
      @bikes.delete(@bikes.find {|bike| bike.working? == true})
    end
end

dock = DockingStation.new
5.times {dock.dock(Bike.new,false)}
5.times {dock.dock(Bike.new,true)}
print dock.release_broken_bikes
