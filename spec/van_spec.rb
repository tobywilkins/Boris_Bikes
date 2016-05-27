require 'van'

describe Van do
let(:dock) {double(:dock)}
let(:garage) {double(:garage)}

	describe "::Van" do
		it {should be_instance_of(Van)}
	end

	describe "#collect_bikes_from_dock" do
		it {should respond_to(:collect_bikes_from_dock)}
		it "collects broken bikes" do
			allow(dock).to receive(:release_broken_bikes).and_return(['bike1', 'bike2', 'bike3'])
			subject.collect_bikes_from_dock(dock)
			expect(subject.bikes).to eq(['bike1', 'bike2', 'bike3'])
		end
	end

	describe '#deliver_bikes_to_garage' do
		it {should respond_to(:deliver_bikes_to_garage).with (1)}
		it 'should deliver the bikes to the garage' do
		allow(dock).to receive(:release_broken_bikes).and_return(['bike1', 'bike2', 'bike3'])
		allow(garage).to receive(:recieve_bikes)
		subject.collect_bikes_from_dock(dock)
		subject.deliver_bikes_to_garage(garage)
		expect(subject.bikes).to eq []
		end
	end
end