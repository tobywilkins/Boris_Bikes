require 'docking_station'

describe DockingStation do

  describe "#release_bike" do
		it 'responds to release_bike' do
			expect(subject).to respond_to :release_bike
		end
		it  'releases a working bike' do
			bike = subject.release_bike
			expect(bike).to be_working
		end
  end

  describe "#dock" do
		it 'responds to dock method' do
			expect(subject).to respond_to :dock
		end
		it 'dock a bike' do
			expect(subject.dock(Bike.new))
		end
  end

	describe 'bike' do
		it 'displays docked bike' do
      bike = Bike.new
			station = DockingStation.new
			station.dock(bike)
			expect(station.bikes).to eq bike
		end
	end
end
