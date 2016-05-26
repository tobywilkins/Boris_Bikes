require 'docking_station'

describe DockingStation do
	it 'responds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end

	# it 'releases a bike' do
	# 	expect(subject.release_bike).is_a? Bike
	# end


	it 'responds to bike method' do
		expect(subject).to respond_to(:bike)
	end

	it 'checks if a bike is docked' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

	describe "#release_bike releases a bike" do
		it 'releases a bike' do
			bike = Bike.new
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end
		it 'raises an error message if there are no bikes available' do
			expect{subject.release_bike}.to raise_error('No bikes available') 
		end
	end 
	describe '#dock(bike) docks a bike' do
		it 'docks a bike' do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end
		it 'raises an error message if we add a bike to a full docking station (20 bikes capacity)' do
			bike = Bike.new
			subject.dock(bike)
			expect{subject.dock(bike)}.to raise_error('Docking station is full')
		end
	end
	
end
