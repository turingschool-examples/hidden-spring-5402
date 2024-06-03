require './lib/ride.rb'
require './lib/biker.rb'

RSpec.describe Biker do
    before(:each) do
        @biker1 = Biker.new("Kenny", 30)
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

end 