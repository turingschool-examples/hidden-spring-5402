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
end