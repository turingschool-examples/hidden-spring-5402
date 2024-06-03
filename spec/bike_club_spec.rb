require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe BikeClub do
  describe '#initialize' do
    it 'exists with attributes' do
      bike_club = BikeClub.new("Wheels On")

      expect(bike_club.name).to eq("Wheels On")
      expect(bike_club.bikers).to eq []
    end
  end

  describe '#add_bikers' do
    it "can add bikers" do
      bike_club = BikeClub.new("Wheels On")
      biker1 = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      bike_club.add_bikers(biker1)
      bike_club.add_bikers(biker2)
    
      expect(bike_club.bikers).to eq [biker1, biker2]
    end
  end

  describe '#most_rides' do
    it 'can return biker object who has most rides' do
      bike_club = BikeClub.new("Wheels On")
      biker1 = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      
      biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance
      biker2.log_ride(ride2, 65.0)

      biker1.log_ride(ride1, 92.5)      
      biker1.log_ride(ride1, 91.1)      
      biker1.log_ride(ride2, 60.9)      
      biker1.log_ride(ride2, 61.6)

      bike_club.add_bikers(biker1)
      bike_club.add_bikers(biker2)

      expect(bike_club.most_rides).to eq("Kenny")
    end
  end

end