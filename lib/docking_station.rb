require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def release_bike
    empty? ? raise('No bikes available') : @bikes.pop
  end
  def dock(bike)
    full? ? raise('Docking station full') : @bikes << bike
  end

  private

    def full?
      @bikes.length >= DEFAULT_CAPACITY
    end

    def empty?
      @bikes == []
    end

end
