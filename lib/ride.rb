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

pry(main)> ride1.name
# => "Walnut Creek Trail"

pry(main)> ride1.distance
# => 10.7

pry(main)> ride1.terrain
# => :hills

pry(main)> ride1.loop?
# => false

pry(main)> ride1.total_distance
# => 21.4