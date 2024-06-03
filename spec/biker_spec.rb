require './spec/spec_helper'
RSpec.describe Ride do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    # pry(main)> biker = Biker.new("Kenny", 30)
    # # => #<Biker:0x00007fc62ca41150...>

    @biker2 = Biker.new("Athena", 15)
    # pry(main)> biker2 = Biker.new("Athena", 15)
    # => #<Biker:0x00007fc62cb399e0...>

    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    # pry(main)> ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    # # => #<Ride:0x00007fc62ca32a10...>

    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    # pry(main)> ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    # # => #<Ride:0x00007fc62cb42ba8...>
  end

  it "can initialize" do
    expect(@biker).to be_an_instance_of(Biker)
  end
  
  it "has a name" do
    expect(@biker.name).to ea("Kenny")
    # pry(main)> biker.name
    # # => "Kenny"
  end
  
  it "has a max distance" do
    expect(@biker.max_distance).to eq(30)
    # pry(main)> biker.max_distance
    # # => 30
  end
  
  it "tracks rides taken" do
    expect(@biker.rides).to eq({})
    # pry(main)> biker.rides
    # # => {}
  end
  
  it "can learn to ride on different terrain types" do
    expect(@biker.acceptable_terrain).to eq([])
    # pry(main)> biker.acceptable_terrain
    # # => []
    
    @biker.learn_terrain!(:gravel)
    # pry(main)> biker.learn_terrain!(:gravel)
    
    @biker.learn_terrain!(:hills)
    # pry(main)> biker.learn_terrain!(:hills)
    
    expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    # pry(main)> biker.acceptable_terrain
    # # => [:gravel, :hills]
  end
  
  describe "how to determine a personal ride record" do
    it "can show a personal record for biker" do
      @biker.log_ride(@ride1, 92.5)
      # pry(main)> biker.log_ride(ride1, 92.5)
      
      @biker.log_ride(@ride1, 91.1)
      # pry(main)> biker.log_ride(ride1, 91.1)
      
      @biker.log_ride(@ride2, 60.9)
      # pry(main)> biker.log_ride(ride2, 60.9)
      
      @biker.log_ride(@ride2, 61.6)
      # pry(main)> biker.log_ride(ride2, 61.6)
      
      expect(@biker.rides).to eq({@ride1: [92.5, 91.1], @ride2: [60.9, 61.6]})
      # pry(main)> biker.rides
      # # => {
        # #      #<Ride:0x00007fc62ca32a10...> => [92.5, 91.1],
        # #      #<Ride:0x00007fc62cb42ba8...> => [60.9, 61.6]
        # #    }

        expect(@biker.personal_record(@ride1)).to eq(91.1)
        # pry(main)> biker.personal_record(ride1)
        # => 91.1
        
        expect(@biker.personal_record(@ride2)).to eq(91.1)
        # pry(main)> biker.personal_record(ride2)
        # => 60.9
    end

    it "can learn terrain but is limited by ride distance for biker2" do
      @biker2.log_ride(@ride1, 97.0)
      # pry(main)> biker2.log_ride(ride1, 97.0) #biker2 doesn't know this terrain yet

      @biker2.log_ride(@ride2, 67.0)
      # pry(main)> biker2.log_ride(ride2, 67.0) #biker2 doesn't know this terrain yet

      @biker2.rides
      # pry(main)> biker2.rides
      # # => {}

      @biker2.learn_terrain!(:gravel)
      # pry(main)> biker2.learn_terrain!(:gravel)

      @biker2.learn_terrain!(:hills)
      # pry(main)> biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0)
      # pry(main)> biker2.log_ride(ride1, 95.0) # biker2 can't bike this distance
                                                # biker2 can ride 65 miles max

      @biker2.log_ride(@ride2, 65.0)
      # pry(main)> biker2.log_ride(ride2, 65.0) # biker2 knows this terrain and can bike this distance

      @biker2.rides
      # pry(main)> biker2.rides
      # #=> { #<Ride:0x00007fc62cb42ba8...> => [65.0] }

      @biker2.personal_record(@ride2)
      # pry(main)> biker2.personal_record(ride2)
      # #=> 65.0

      @biker2.personal_record(@ride1)
      # pry(main)> biker2.personal_record(ride1)
      # #=> false
    end
  end  
end



