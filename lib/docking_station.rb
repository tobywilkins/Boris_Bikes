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
  def dock(bike, broken=false)
    full? ? raise('Docking station full') : @bikes << bike
    bike.working = (false) if broken == "broken"
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
