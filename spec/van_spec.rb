require 'van'
require 'docking_station'

describe Van do
  let(:dock) {double(:dock)}

  describe '::new' do
    it {should be_instance_of(Van)}
    it 'should start being empty' do
    expect(subject.bikes).to eq []
    end
  end

  describe '#collect_bikes_from_dock(dock)' do
    it {should respond_to(:collect_bikes_from_dock).with(1)}
    it 'store broken bikes in van' do
      allow(dock).to receive(:release_broken_bikes).and_return(["bike1","bike2","bike3"])
      expect(subject.collect_bikes_from_dock(dock)).to eq ["bike1","bike2","bike3"]
    end
  end

  describe '#drop_bikes_at_garage(garage)' do
    it {should respond_to(:drop_bikes_at_garage).with(1)}
    it 'removes bikes from van' do
      dock = double(:dock)
      allow(dock).to receive(:collect_bikes_from_dock).and_return(["bike1","bike2","bike3"])
      allow(dock).to receive(:release_broken_bikes).and_return(["bike1","bike2","bike3"])
    subject.collect_bikes_from_dock(dock)
    garage = double(:garage)
      allow(garage).to receive(:accept_bikes)
    subject.drop_bikes_at_garage(garage)
    expect(subject.bikes).to eq []
    end
  end

  describe '#collect_bikes_from_garage' do
    it {should respond_to(:collect_bikes_from_garage).with(1)}
    it 'should add fixed bikes to van' do
      garage = double(:garage,:bikes => ["bike1","bike2","bike3"])
      allow(garage).to receive(:bikes=)
    expect(subject.collect_bikes_from_garage(garage)).to eq ["bike1","bike2","bike3"]
    end
  end

  describe '#drop_bikes_at_dock' do
    it {should respond_to(:collect_bikes_from_dock).with(1)}
    it 'should drop bikes if not at capacity' do
    bike = double(:bike,:broken= => false)
    garage = double(:garage,:bikes => [bike,bike,bike])
    dock = DockingStation.new
    allow(garage).to receive(:bikes=)
    subject.collect_bikes_from_garage(garage)
    expect(subject.drop_bikes_at_dock(dock)).to eq []
    end
    it 'should raise error if at capacity' do
    bike = double(:bike,:broken= => false)
    garage = double(:garage,:bikes => [bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike,bike])
    dock = DockingStation.new
    allow(garage).to receive(:bikes=)
    subject.collect_bikes_from_garage(garage)
    expect{subject.drop_bikes_at_dock(dock)}.to raise_error('Docking station is full')

    end
  end

end