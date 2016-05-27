class Garage
attr_reader :bikes
  def initialize
    @bikes = []
  end

  def recieve_bikes(bikes)
    @bikes << bikes
  end

  def release_fixed_bikes
  	sorted = @bikes.flatten.partition {|bike| bike.working? == true}
	@bikes = sorted[1]
	sorted[0]
  end
end