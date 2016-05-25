require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def release_bike
    empty? ? raise('No bikes available') : (@bikes.last.working ? @bikes.pop : raise('Last bike broken'))
  end
  def dock(bike, broken=false)
    full? ? raise('Docking station full') : @bikes << bike
    bike.working = false if broken == "broken"
  end

  private

    def full?
      @bikes.length >= @capacity
    end

    def empty?
      @bikes == []
    end

end
