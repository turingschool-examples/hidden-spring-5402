require './lib/ride'
require './lib/biker'

RSpec.configure do |config|
    config.formatter = :documentation
    end

    RSpec.describe Biker do
       before(:each) do
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
       end

       it 'exists' do
        expect(@biker).to be_a(Biker)
        expect(@biker2).to be_a(Biker)
       end

       it 'has attributes like name and max_distance they can ride' do
        expect(@biker.name).to eq("Kenny")
        expect(@biker.max_distance).to eq(30)
       end

       it 'has no rides registered by default' do
        expect(@biker.rides).to eq({})
        expect(@biker2.rides).to eq({}) 
       end

       it 'has no acceptable_terrain by default' do
        expect(@biker.acceptable_terrain).to eq([])
        expect(@biker2.acceptable_terrain).to eq([])
       end

       it 'can show learning terrain and storing it in an array' do
        expect(@biker.acceptable_terrain).to eq([])
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)
        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
       end


    end