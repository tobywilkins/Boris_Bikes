require 'docking_station'
require 'bike'
require 'van'

describe 'feature test' do
	it "works" do
		dock = DockingStation.new
		bike = Bike.new
		dock.dock(bike, false)
		van = Van.new
		van.collect_bikes_from_dock(dock)

	end
end
	
