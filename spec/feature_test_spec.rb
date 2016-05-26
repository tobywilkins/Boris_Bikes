require 'docking_station'
require 'bike'
require 'van'
require 'garage'


describe 'feature test' do
  it 'works' do
    dock = DockingStation.new
    3.times do dock.dock(Bike.new,false) end
    17.times do dock.dock(Bike.new,true) end
    daniel = Van.new
    daniel.collect_bikes_from_dock(dock)
    daniel.bikes
    london = Garage.new
    daniel.drop_bikes_at_garage(london)
    daniel.collect_bikes_from_garage(london)
    daniel.drop_bikes_at_dock(dock)
    p daniel.bikes
  end
end