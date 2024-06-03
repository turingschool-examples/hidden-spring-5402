require './lib/ride.rb'
require './lib/biker.rb'

RSpec.describe Biker do
    before(:each) do
        @biker1 = Biker.new("Kenny", 30)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    end

    describe "#initialize" do
        it "exists" do expect(@biker1).to be_an_instance_of(Biker)
        end

        it "has biker's max_distance" do
            expect(@biker1.max_distance).to eq(30)
        end

        it "has biker's rides" do
            expect(@biker1.rides).to eq({})
        end

        it "has biker's acceptable_terrain" do
            expect(@biker1.acceptable_terrain).to eq([])
        end
    end

    describe "#learn_terrain!" do
        it "can have biker learn new_terrain" do
            expect(@biker1.acceptable_terrain).to eq([])
            @biker1.learn_terrain!(:gravel)
            expect(@biker1.acceptable_terrain).to eq([:gravel])
        end

        it "can add multiple terrains to biker" do
            expect(@biker1.acceptable_terrain).to eq([])
            @biker1.learn_terrain!(:gravel)
            expect(@biker1.acceptable_terrain).to eq([:gravel])
            @biker1.learn_terrain!(:hills)
            expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])
        end
    end

    describe "#log_ride" do
        it "can log bikers rides" do
            @biker1.log_ride(@ride1, 10.7)
            @biker1.log_ride(@ride1, 91.1)
            @biker1.log_ride(@ride2, 60.9)
            @biker1.log_ride(@ride2, 61.6)
            expect(@biker1.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})
        end

    end

end 