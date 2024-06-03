require './spec/spec_helper'
RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    # pry(main)> ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    # # => #<Ride:0x00007f845c279ee8...>
    
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    # pry(main)> ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    # # => #<Ride:0x00007f845c228b38...>
  end

  it "can initialize" do
    expect(@ride1).to be_an_instance_of(Ride)
    expect(@ride2).to be_an_instance_of(Ride)
  end

  it "has a name" do
    expect(@ride1.name).to eq("Walnut Creek Trail")
    # pry(main)> ride1.name
    # # => "Walnut Creek Trail"
  end

  it "has a distance" do
    expect(@ride1.distance).to eq(10.7)
    # pry(main)> ride1.distance
    # # => 10.7
  end

  it "is either a loop or not" do
    expect(@ride1.loop?).to eq(false)
    # pry(main)> ride1.loop?
    # # => false

    expect(@ride2.loop?).to eq(true)
    # pry(main)> ride2.loop?
    # # => true
  end

  it "has a terrain type" do
    expect(@ride1.terrain).to eq(:hills)
    # pry(main)> ride1.terrain
    # # => :hills
  end
    
  it "doubles the distance for total_distance if not a loop" do
    expect(@ride1.total_distance).to eq(21.4)
    # pry(main)> ride1.total_distance
    # # => 21.4
    
    expect(@ride2.total_distance).to eq(14.9)
    # pry(main)> ride2.total_distance
    # # => 14.9
  end
end








