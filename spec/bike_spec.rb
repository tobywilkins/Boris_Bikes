require 'bike'

describe Bike do
    it 'responds to method broken' do
    expect(subject).to respond_to (:broken?)
  end
	it 'is not broken when created' do
		expect(subject).to_not be_broken
	end
end
