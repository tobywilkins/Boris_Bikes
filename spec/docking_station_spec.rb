require 'docking_station'

describe DockingStation do
  let(:bike) {double(:bike,:working => true,:working? => true)}

  describe "initialize docking station at set capacity" do
    it 'accepts an argument when created' do
      expect DockingStation.new(40)
    end
    it 'sets default capacity if no argument is given' do
      20.times{subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error("Docking station full")
    end
  end

  describe "#release_bike" do
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end
    it  'releases a working bike' do
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end
    it 'raise error if there are no bikes' do
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
    it 'will not release broken bike' do
      allow(bike).to receive(:working=)
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike, "broken")
      expect{subject.release_bike}.to raise_error("No bikes available")
    end

  end

  describe "#dock" do
    it 'responds to dock method' do
      expect(subject).to respond_to :dock
    end
    it 'dock a bike' do
      expect(subject.dock(bike))
    end
    it 'raise error if station already full' do
      20.times{subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error("Docking station full")
    end
    it 'allows user to report if bike is broken when docking' do
      expect(subject.dock(bike, true))
    end
  end

  describe 'bike' do
    it 'displays docked bike' do
      subject.dock(bike)
      expect(subject.bikes.last).to eq bike
    end
  end
end
