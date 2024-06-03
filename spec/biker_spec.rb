require 'spec_helper.rb'

RSpec.describe Biker do
  before(:each) do
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "it can initialize" do 
    it "can initialize a new biker" do
      expect(@biker1.name).to eq("Kenny")
      expect(@biker1.max_distance).to eq(30)
      expect(@biker1.rides).to eq({})
      expect(@biker1.acceptable_terrain).to eq([])
    end
    it "can initialize a differetmt biker" do
      expect(@biker2.name).to eq("Athena")
      expect(@biker2.max_distance).to eq(15)
      expect(@biker2.rides).to eq({})
      expect(@biker2.acceptable_terrain).to eq([])
    end
  end

  it "can learn to ride new terrain" do
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)

    expect(@biker1.acceptable_terrain).to eq([:gravel, :hills])
  end

  it "can log a ride" do 
    @biker1.log_ride(@ride1, 92.5)
    @biker1.log_ride(@ride1, 91.1)
    @biker1.log_ride(@ride2, 60.9)
    @biker1.log_ride(@ride2, 61.6)

    epxect(@biker1.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6])
  end

  it "can return a rider's personal best times from logged rides" do
    
  end
end