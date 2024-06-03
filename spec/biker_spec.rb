require './lib/ride'
require './lib/biker'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Biker do
  describe '#initialize' do
    it 'exists with attributes' do
      biker = Biker.new("Kenny", 30)
      
      expect(biker).to be_a Biker
      expect(biker.name).to eq ("Kenny")
      expect(biker.max_distance).to eq 30
      expect(biker.rides).to eq ({})
      expect(biker.acceptable_terrain).to eq []
    end
  end

  describe '#learn_terrain!' do
    it 'can add new terrain to acceptalbe_terrain array' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      
      expect(biker.acceptable_terrain).to eq [:gravel, :hills]
    end
  end

  describe '#log_ride' do
    it 'can log a ride in attribute @rides hash' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker.log_ride(ride1, 92.5)      
      biker.log_ride(ride1, 91.1)      
      biker.log_ride(ride2, 60.9)      
      biker.log_ride(ride2, 61.6)

      expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
    end
  end

  describe '#personal_record' do
    it 'can return lowest time when passed a ride route' do
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker.log_ride(ride1, 92.5)      
      biker.log_ride(ride1, 91.1)      
      biker.log_ride(ride2, 60.9)      
      biker.log_ride(ride2, 61.6)

      expect(biker.personal_record(ride1)).to eq 91.1
      expect(biker.personal_record(ride2)).to eq 60.9
    end
  end
  
end