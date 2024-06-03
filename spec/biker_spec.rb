require './lib/ride'
require './lib/biker'

RSpec.describe Biker do 
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do
    it 'creates a Biker instance' do
      expect(@biker).to be_an_instance_of(Biker)
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain!' do
    it 'adds terrain types to #acceptable_terrain' do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to include(:gravel, :hills)
    end
  end

  describe '#log_ride' do
    it 'logs rides with a time if terrain is acceptable' do
      @biker.learn_terrain!(:hills)
      @biker.learn_terrain!(:gravel)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides[@ride1]).to eq([92.5, 91.1])
      expect(@biker.rides[@ride2]).to eq([60.9, 61.6])
    end

    it 'will not log a ride if unacceptable terrain' do
      @biker.log_ride(@ride1, 92.5)
      expect(@biker.rides).to eq({})
    end

    it 'will not log a ride longer than #max_distance' do
      biker2 = Biker.new("Athena", 15)
      biker2.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.log_ride(@ride1, 95.0)
      biker2.log_ride(@ride2, 65.0)
      expect(biker2.rides).to eq({@ride2 => [65.0]})
    end
  end

  describe '#personal_record' do
    it 'will return fastest ride time' do
      @biker.learn_terrain!(:hills)
      @biker.learn_terrain!(:gravel)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end

    it 'will return false if ride not completed' do
      expect(@biker.personal_record(@ride1)).to eq(false)
    end
  end
end

