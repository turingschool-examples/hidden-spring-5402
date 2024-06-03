require 'rspec'
require './lib/ride'
require './lib/biker'
require 'pry'

RSpec.describe Biker do
  describe 'attributes' do
    it 'has a name' do
      biker = Biker.new("Kenny", 30)
      expect(biker.name).to eq("Kenny")
    end

    it 'has a max_distance' do
      biker = Biker.new("Kenny", 30)
      expect(biker.max_distance).to eq(30)
    end

    it 'starts with no rides' do
      biker = Biker.new("Kenny", 30)
      expect(biker.rides).to eq({})
    end

    it 'starts with no acceptable terrain' do
      biker = Biker.new("Kenny", 30)
      expect(biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain!' do
    it 'can learn new terrain' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride' do
    it 'can log a ride with a time' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:hills)
      biker.learn_terrain!(:gravel)
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.rides).to eq({
        ride1 => [92.5, 91.1],
        ride2 => [60.9, 61.6]
      })
    end

    it 'does not log a ride if terrain is not acceptable' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      biker.log_ride(ride1, 97.0)
      expect(biker.rides).to eq({})
    end

    it 'does not log a ride if distance is greater than max distance' do
      biker = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      biker.learn_terrain!(:hills)
      biker.log_ride(ride1, 95.0)
      expect(biker.rides).to eq({})
    end
  end

  describe '#personal_record' do
    it 'returns the lowest time recorded for a ride' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:hills)
      biker.learn_terrain!(:gravel)
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.personal_record(ride1)).to eq(91.1)
      expect(biker.personal_record(ride2)).to eq(60.9)
    end

    it 'returns false if the biker has not completed the ride' do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

      expect(biker.personal_record(ride1)).to eq(false)
    end
  end
end