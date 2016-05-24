require 'docking_station'

describe DockingStation do
	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end

	it "returns a working bike" do
		bike = subject.release_bike
		expect(bike).to be_working
	end

	it "responds to dock" do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	it "Docks a bike when passed one" do
		bike = Bike.new
		expect(subject.dock(bike)).to eq bike
	end

	it "responds to bike" do
		expect(subject).to respond_to :bike
	end

	it "returns docked bikes" do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end
	

end