require 'spec_helper'

RSpec.describe Biker do
    it 'exists' do
        biker = Biker.new("Sal", 30)
        expect(biker).to be_a(Biker)
    end

    it 'has a name' do
        biker = Biker.new("Sal", 30)
        expect(biker.name).to eq("Sal")
    end

    it 'has a max_distance' do
        biker = Biker.new("Sal", 30)
        expect(biker.max_distance).to eq(30)
    end

    it 'can learn an read terrains' do
        biker = Biker.new("Sal", 30)
        biker.learn_terrain!(:gravel)
        biker.learn_terrain!(:hills)
        expect(biker.acceptable_terrains).to eq([:gravel, :hills])
    end

    it 'can add rides' do
        biker = Biker.new("Sal", 30)
        biker.learn_terrain!(:gravel)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10, loop: true, terrain: :gravel})
        biker.log_ride(ride1, 60.2)
        expect(biker.rides).to eq({ride1 => [60.2]})
        expect { biker.log_ride(ride1, 60.2) }.to output("Sal knows this terrain and can bike this distance.\n").to_stdout
    end

    describe 'log_ride method' do
        it 'can add multiple rides' do
            biker = Biker.new("Sal", 30)
            biker.learn_terrain!(:gravel)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10, loop: true, terrain: :gravel})
            ride1 = Ride.new({name: "Cherry Creek Trail", distance: 7, loop: false, terrain: :gravel})
            biker.log_ride(ride1, 60.2)
            biker.log_ride(ride1, 40.2)
            expect(biker.rides).to eq({ride1 => [60.2, 40.2]})
        end

        it 'will not add rides with terrains that are not acceptable' do
            biker = Biker.new("Sal", 30)
            biker.learn_terrain!(:gravel)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10, loop: true, terrain: :hills})
            biker.log_ride(ride1, 60.2)
            expect(biker.rides).to eq({})
            expect { biker.log_ride(ride1, 60.2) }.to output("Sal does not know this terrain yet.\n").to_stdout
        end

        it 'will not add rides that are too long' do
            biker = Biker.new("Sal", 30)
            biker.learn_terrain!(:gravel)
            #this rides distance is 32.0 so it should not log.
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 16, loop: false, terrain: :gravel})
            biker.log_ride(ride1, 60.2)
            expect(biker.rides).to eq({})
            expect { biker.log_ride(ride1, 60.2) }.to output("Sal cannot ride that far.\n").to_stdout
        end
    end

    describe 'personal_record_for method' do
        it 'can find the personal record for a ride' do
            biker = Biker.new("Sal", 30)
            biker.learn_terrain!(:gravel)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10, loop: true, terrain: :gravel})
            biker.log_ride(ride1, 60.2)
            biker.log_ride(ride1, 40.2)
            expect(biker.personal_record_for(ride1)).to eq(40.2)
        end

        #will not log ride because of its distance. Will return false due to the @rides hash being empty.
        it 'returns false if there is no personal record' do
            biker = Biker.new("Sal", 30)
            biker.learn_terrain!(:gravel)
            ride1 = Ride.new({name: "Walnut Creek Trail", distance: 16, loop: false, terrain: :gravel})
            biker.log_ride(ride1, 60.2)
            expect(biker.personal_record_for(ride1)).to eq(false)
        end
    end
end