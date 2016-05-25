require 'bike'

  describe Bike do
  it { should be_instance_of(Bike)}

  it {is_expected.to respond_to(:working?)}
end
