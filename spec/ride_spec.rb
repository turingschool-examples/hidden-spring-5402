require './lib/ride'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Ride do
  describe '#initialize' do
    it 'exists with attributes' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(ride1).to be_a Ride
      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq 10.7
      expect(ride1.terrain).to eq(:hills)
    end
  end

  describe '#total_distance' do
    it 'can determine total distance based on if trail is a loop or out-and-back' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride1.loop?).to eq false
      expect(ride1.total_distance).to eq 21.4
      expect(ride2.loop?).to eq true
      expect(ride2.total_distance).to eq 14.9
    end
  end
end