require 'garage'

describe Garage do
let(:van) {double(:van)}

  describe '::new' do
    it {should be_instance_of(Garage)}
  end

  describe '#recieve_bikes' do
    it{should respond_to(:recieve_bikes).with (1)}
    it 'should receive bikes' do
    expect(subject.recieve_bikes([1,2,3,4,5,6,7])).to eq([1,2,3,4,5,6,7])
    end
  end

end