require 'rspec'
require './lib/ride'

RSpec.describe Ride do
  describe '#initialize' do
    it 'creates a Ride instance' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1).to be_an_instance_of(Ride)
      expect(ride1.name).to eq("Walnut Creek Trail")
      expect(ride1.distance).to eq(10.7)
      expect(ride1.terrain).to eq(:hills)
    end
  end

  describe '#loop?' do
    it 'is true if it is a loop' do
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})     
      expect(ride2.loop?).to be true
    end

    it 'is false if it is not a loop' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})     
      expect(ride1.loop?).to be false
    end
  end

  describe '#total_distance' do
    it 'if not a loop distance is doubled' do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      expect(ride1.total_distance).to eq(21.4)
    end

    it 'returns base distance if loop' do
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      expect(ride2.total_distance).to eq(14.9)
    end
  end
end
