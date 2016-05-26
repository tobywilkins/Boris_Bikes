require 'garage'

describe Garage do
  describe '::new' do
    it {should be_instance_of(Garage)}
    it 'should start with no bikes' do
      expect(subject.bikes).to eq []
    end
  end
  describe '#accept_bikes(bikes)' do
    it 'responds to the method' do
    expect(subject).to respond_to(:accept_bikes).with(1)
    end
    it 'updates the number of stored bikes' do
    bike = double(:bike,:broken= => true)
    allow(bike).to receive(:fix_bikes)
    subject.accept_bikes([bike,bike,bike])
    expect(subject.bikes).to eq [bike,bike,bike]
    end
  end
end