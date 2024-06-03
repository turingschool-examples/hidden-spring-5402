require './lib/bike_club'
require './lib/biker'
require './lib/ride'

RSpec.describe BikeClub do
  describe '#initialize' do
    it 'creates a BikeClubb instance with a name' do
      club_name = "Peddling Peddlers"
      club = BikeClub.new(club_name)
      expect(club).to be_an_instance_of(BikeClub)
      expect(club.name).to eq(club_name)
      expect(club.bikers).to be_empty
    end
  end

  describe '#add_biker' do
    before(:each) do
      @club = BikeClub.new("Peddling Peddlers")
      @biker1 = Biker.new("Chumba", 20)
      @biker2 = Biker.new("Wumba", 25)
    end

    it 'adds a biker' do
      @club.add_biker(@biker1)
      @club.add_biker(@biker2)
      expect(@club.bikers).to contain_exactly(@biker1, @biker2)
    end
  end

  describe '#most_rides' do
    it 'returns biker with most rides' do
      club = BikeClub.new("Peddling Peddlers")
      biker1 = Biker.new("Huwie", 10)
      biker2 = Biker.new("Dewie", 10)
      biker3 = Biker.new("Lewie", 10)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      ride3 = Ride.new({name: "Another Ride", distance: 20.0, loop: false, terrain: :mountain})

      club.add_biker(biker1)
      club.add_biker(biker2)
      club.add_biker(biker3)
      
      5.times { biker1.log_ride(ride1, 30) }
      3.times { biker2.log_ride(ride2, 30) }
      2.times { biker3.log_ride(ride1, 30) }

      expect(club.most_rides).to eq(biker1)
    end

    it 'returns nil if no logged rides' do
      club = BikeClub.new("Peddling Peddlers")
      expect(club.most_rides).to be_nil
    end
  end
end

