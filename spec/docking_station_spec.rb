require 'docking_station'
require 'bike'

describe DockingStation do
	let(:bike) {double(:bike,:broken? => false)}

	it 'responds to release_bike' do
		expect(subject).to respond_to(:release_bike)
	end

	it 'responds to bike method' do
		expect(subject).to respond_to(:bikes)
	end

	it 'checks if a bike is docked' do
		subject.dock(bike)
		expect(subject.bikes).to eq [bike]
	end

	describe "#release_bike" do
		it 'releases a bike' do
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end
		it 'raises an error message if there are no bikes available' do
			expect{subject.release_bike}.to raise_error('No bikes available')
		end
		it 'does not release bike if broken' do
		dock = DockingStation.new
		dock.dock(bike,true)
		expect{dock.release_bike}.to raise_error ("No bikes available")
		end
	end

	describe '#dock(bike)' do
		it 'docks a bike' do
		expect(subject.dock(bike)).to eq [bike]
	end
		it 'raises an error message if we add a bike to a full docking station (20 bikes capacity)' do
			DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
			expect{subject.dock(bike)}.to raise_error('Docking station is full')
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
