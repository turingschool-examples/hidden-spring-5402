require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)

    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe 'initialize' do 
    it 'creates a biker' do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "learn_terrain" do
    it "adds terrain to acceptable_terrain" do
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to include(:hills)
    end
  end

  describe "log_ride" do
    it "logs ride in your rides list" do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride2, 60.9)
  
      expect(@biker.rides.keys).to include(@ride1, @ride2)
    end
  end

  describe "personal_record" do
    it "returns the personal record for a specific ride" do
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
  
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end
  
end
