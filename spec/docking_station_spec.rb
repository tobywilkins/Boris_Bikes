require 'docking_station'

describe DockingStation do
	it 'repsonds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end
	it 'releases a bike' do
		expect(subject.release_bike).is_a? Bike
	end
end
