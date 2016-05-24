require 'DockingStation'
require 'bike'

  dock_a = DockingStation.new

  describe DockingStation do

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { subject.release_bike.should be_instance_of(Bike) }

  it { is_expected.to respond_to(:bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns the nil if no bike has been docked' do
  expect(dock_a.bike).to eq(nil)
  end

  it 'returns the bike if bike has been docked' do
  dock_a.dock("bike3")
  expect(dock_a.bike).to eq("bike3")
  end
  end

