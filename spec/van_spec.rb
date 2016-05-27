require 'van'

describe Van do
	describe "::Van" do
		it {should be_instance_of(Van)}
	end
	describe "#collect_bikes_from_dock" do
		it {should respond_to(:collect_bikes_from_dock)}
		it "collects broken bikes" do
			dock = double(:dock)
			allow(dock).to receive(:release_broken_bikes).and_return(['bike1', 'bike2', 'bike3'])
			subject.collect_bikes_from_dock(dock)
			expect(subject.bikes).to eq(['bike1', 'bike2', 'bike3'])
		end
	end
end