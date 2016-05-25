require 'docking_station'

describe DockingStation do
  describe "initialize docking station at set capacity" do
    it 'accepts an argument when created' do
      expect DockingStation.new(40)
    end
    it 'sets default capacity if no argument is given' do
      station = DockingStation.new
      20.times{station.dock(Bike.new)}
      expect {station.dock(Bike.new)}.to raise_error("Docking station full")
    end
  end

  describe "#release_bike" do
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end
    it  'releases a working bike' do
      station = DockingStation.new
      station.dock(Bike.new)
      bike = station.release_bike
      expect(bike).to be_working
    end
    it 'raise error if there are no bikes' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

  end

  describe "#dock" do
    it 'responds to dock method' do
      expect(subject).to respond_to :dock
    end
    it 'dock a bike' do
      expect(subject.dock(Bike.new))
    end
    it 'raise error if station already full' do
      station = DockingStation.new
      20.times{station.dock(Bike.new)}
      expect {station.dock(Bike.new)}.to raise_error("Docking station full")
    end
  end

  describe 'bike' do
    it 'displays docked bike' do
      bike = Bike.new
      station = DockingStation.new
      station.dock(bike)
      expect(station.bikes.last).to eq bike
    end
  end
end
