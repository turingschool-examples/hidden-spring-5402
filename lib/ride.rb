require './lib/ride'

class Ride
  attr_reader :name, :distance, :loop, terrain:

  def name
  end    

  def distance
  end
    
  def loop
  end

  def terrain
  end
end

ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

ride2 =Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})