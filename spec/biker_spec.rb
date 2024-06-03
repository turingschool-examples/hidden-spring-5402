require './lib/ride'
require './lib/biker'
require 'pry'

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

       it 'can show bikers learning terrain and storing it in an array' do
        expect(@biker.acceptable_terrain).to eq([])
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)
        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
       end

       it 'can log_ride for each biker' do
       @biker.log_ride(@ride1, 92.5)
       @biker.log_ride(@ride1, 91.1)
       @biker.log_ride(@ride2, 60.9)
       @biker.log_ride(@ride2, 61.6)
       expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})
       end

       it 'can determine bikers personal_record' do
        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)
        expect(@biker.personal_record(@ride1)).to eq(91.1)
        expect(@biker.personal_record(@ride2)).to eq(60.9)
        
       end

    #    it 'can log_ride for another biker' do
    #     @biker2.log_ride(@ride1, 97.0)
    #     @biker2.log_ride(@ride2, 67.0)
    #     expect(@biker2.rides).to eq({}) 
    #     biker2.learn_terrain!(:gravel)
    #     biker2.learn_terrain!(:hills)
    #     expect()


    #    end


    end