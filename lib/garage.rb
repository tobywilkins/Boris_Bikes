class Garage
attr_accessor :bikes
  def initialize
    @bikes = []
  end

  def accept_bikes(bikes)
    @bikes = bikes
    fix_bikes
  end

  private

  def fix_bikes
  @bikes.each {|bike| bike.broken = false}
  end
end