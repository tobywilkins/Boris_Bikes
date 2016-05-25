require 'bike'

describe Bike do
	it 'responds to method working?' do
		expect(subject).to respond_to (:working?)
	end	
end