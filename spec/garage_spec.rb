require 'garage'

describe Garage do

	let(:bike) {double(:bike,:working= => true,:working? => true)}
	let(:broken_bike) {double(:bike,:working= => false,:working? => false)}	
	let(:van) {double(:van)}

  describe '::new' do
    it {should be_instance_of(Garage)}
  end

  describe '#recieve_bikes' do
    it{should respond_to(:recieve_bikes).with (1)}
    it 'should receive bikes' do
    expect(subject.recieve_bikes([1,2,3,4,5,6,7])).to eq([[1,2,3,4,5,6,7]])
    end
  end

  describe '#release_fixed_bikes' do
  	it{should respond_to(:release_fixed_bikes)}
  	it 'should release fixed bikes' do
      5.times {subject.recieve_bikes(bike)}
      10.times {subject.recieve_bikes(broken_bike)}
      expect(subject.release_fixed_bikes.count).to eq 5
    end
  end
end