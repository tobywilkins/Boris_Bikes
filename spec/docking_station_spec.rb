require 'docking_station'

describe DockingStation do
	it 'responds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end
	it 'releases a bike' do
		expect(subject.release_bike).is_a? Bike
	end
	it 'docks a bike' do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end
	
	it 'checks if a bike is docked' do
		expect(subject.bike).to eq @bike
	end
		
end
