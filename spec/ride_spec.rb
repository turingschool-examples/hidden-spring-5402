require 'rspec'
require './lib/ride'
require 'pry'

RSpec.describe Ride do
  describe 'attribues' do 

    it 'has a name' do 
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # binding.pry
      expect(ride.name).to eq("Walnut Creek Trail")
    end

    it 'has a distance' do 
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # binding.pry
      expect(ride.distance).to eq(10.7)
    end

    it 'has a terrain' do
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # binding.pry
      expect(ride.terrain). to eq(:hills)
    end

    it 'can tell if route is a loop' do
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # binding.pry
      expect(ride.loop?).to be false 

      ride = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      # binding.pry
      expect(ride.loop?).to be true
    end
  end
  describe '#total_distance' do

    it 'can calculate the total distance' do 
      ride = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      # binding.pry
      expect(ride.total_distance). to eq(21.4)

      ride = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      # binding.pry
      expect(ride.total_distance). to eq(14.9)
    end
  end
end