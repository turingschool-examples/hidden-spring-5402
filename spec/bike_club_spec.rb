require 'spec_helper'

RSpec.describe BikeClub do
    it 'exists' do
        bike_club = BikeClub.new("Sons of Anarchy")
        expect(bike_club).to be_a(BikeClub)
    end

    it 'has a name' do
        bike_club = BikeClub.new("Sons of Anarchy")
        expect(bike_club.name).to eq("Sons of Anarchy")
    end

    it 'has bikers' do
        bike_club = BikeClub.new("Sons of Anarchy")
        expect(bike_club.bikers).to eq([])
    end

    describe 'add_biker' do
        it 'can add bikers' do
            bike_club = BikeClub.new("Sons of Anarchy")
            biker = Biker.new("Sal", 30)
            bike_club.add_biker(biker)
            expect(bike_club.bikers).to eq([biker])
        end
    end

    describe 'most_rides' do
        it 'can find the biker with the most rides' do
            bike_club = BikeClub.new("Sons of Anarchy")
            biker1 = Biker.new("Sal", 30)
            biker2 = Biker.new("Sam", 13)
            biker3 = Biker.new("Sue", 20)
            biker1.learn_terrain!(:gravel)
            biker2.learn_terrain!(:gravel)
            biker3.learn_terrain!(:gravel)

            bike_club.add_biker(biker1)
            bike_club.add_biker(biker2)
            bike_club.add_biker(biker3)

            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10, loop: true, terrain: :gravel})
            ride2 = Ride.new({name: "Cherry Creek Trail", distance: 7, loop: false, terrain: :gravel})
            ride3 = Ride.new({name: "Mountain Pass", distance: 14, loop: false, terrain: :gravel})

            biker1.log_ride(ride1, 60.2)
            biker1.log_ride(ride2, 40.2)
            biker1.log_ride(ride3, 30.2)
            biker2.log_ride(ride1, 60.2)
            biker2.log_ride(ride2, 40.2)
            biker3.log_ride(ride1, 60.2)
            biker3.log_ride(ride2, 40.2)

            expect(bike_club.most_rides).to eq(biker1)
            expect(biker1.rides.length).to eq(3)
            expect(biker2.rides.length).to eq(1)
            expect(biker3.rides.length).to eq(2)
        end
    end
end