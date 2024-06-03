class Ride
  attr_reader :name, 
              :distance, 
              :terrain
  
  def initialize(ride_hash)
    @name = ride_hash[:name]
    @distance = ride_hash[:distance]
    @terrain = ride_hash[:terrain]
    @loop = ride_hash[:loop]
  end

  
end