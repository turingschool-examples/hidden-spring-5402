require 'spec_helper'

RSpec.describe Ride do
    it 'exists' do
        ride1 = Ride.new({name: 'Park Loop', distance: 10, loop: true, terrain: 'flat'})
        expect(ride1).to be_a(Ride)
    end

    it 'has readable attributes' do
        ride1 = Ride.new({name: 'Park Loop', distance: 10, loop: true, terrain: 'flat'})
        expect(ride1.name).to eq('Park Loop')
        expect(ride1.distance).to eq(10)
        expect(ride1.loop).to eq(true)
        expect(ride1.terrain).to eq('flat')
    end

    it 'can determine if a ride is a loop' do
        ride1 = Ride.new({name: 'Park Loop', distance: 10, loop: false, terrain: 'flat'})
        expect(ride1.loop?).to eq(false)
    end

    it 'can calculate the total distance of a ride' do
        ride1 = Ride.new({name: 'Park Loop', distance: 10, loop: true, terrain: 'flat'})
        ride2 = Ride.new({name: 'Creek Park Loop', distance: 10.4, loop: false, terrain: 'flat'})
        expect(ride1.total_distance).to eq(nil)
        expect(ride2.total_distance).to eq(20.8)
    end
end