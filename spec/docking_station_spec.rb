require 'docking_station'
require 'bike'

describe DockingStation do
	it 'responds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end

	# it 'releases a bike' do
	# 	expect(subject.release_bike).is_a? Bike
	# end


	it 'responds to bike method' do
		expect(subject).to respond_to(:bikes)
	end

	it 'checks if a bike is docked' do
		bikeA = Bike.new
		subject.dock(bikeA)
		expect(subject.bikes).to eq [bikeA]
	end

	describe "#release_bike" do
		it 'releases a bike' do
			bikeA = Bike.new
			subject.dock(bikeA)
			expect(subject.release_bike).to eq bikeA
		end
		it 'raises an error message if there are no bikes available' do
			expect{subject.release_bike}.to raise_error('No bikes available')
		end
		it 'does not release bike if broken' do
		bike = Bike.new
		dock = DockingStation.new
		dock.dock(bike,true)
		expect{dock.release_bike}.to raise_error ("No bikes available")
		end
	end

	describe '#dock(bike)' do
		it 'docks a bike' do
		bikeA = Bike.new
		expect(subject.dock(bikeA)).to eq [bikeA]
	end
		it 'raises an error message if we add a bike to a full docking station (20 bikes capacity)' do
			bike = Bike.new
			DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
			expect{subject.dock(bike)}.to raise_error('Docking station is full')
		end
		it 'sets broken if bike is broken' do
		bike = Bike.new
		dock = DockingStation.new
		dock.dock(bike,true)
		expect(bike.broken?).to eq true
		end
	end
	describe '#initialize' do
		it "should take the constant value if no capacity exists" do
			dockA = DockingStation.new
			expect(dockA.capacity).to eq 20
		end
		it 'should take custom capacity' do
			dockA = DockingStation.new (10)
			expect(dockA.capacity).to eq 10
		end
	end

end
