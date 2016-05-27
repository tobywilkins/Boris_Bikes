require 'docking_station'

describe DockingStation do
  let(:bike) {double(:bike,:working= => true,:working? => true)}
  let(:broken_bike) {double(:bike,:working= => false,:working? => false)}

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

  describe '#release_broken_bikes' do
    it {should respond_to(:release_broken_bikes)}
    it 'should release broken bikes' do
      5.times {subject.dock(bike)}
      10.times {subject.dock(broken_bike)}
      expect(subject.release_broken_bikes.count).to eq 10
    end
  end

  describe '#receive_bikes' do
    it {should respond_to(:receive_bikes)}
    it 'should receive bikes' do
    expect(subject.receive_bikes([1,2,3,4,5,6,7])).to eq([1,2,3,4,5,6,7])
    end
    it 'should not receive too many bikes' do
    expect{subject.receive_bikes([*1..30])}.to raise_error("Docking station full")
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
