class Ride
    attr_reader :name,
                :distance,
                :loop,
                :terrain

  def initialize(ride_details)
    @name = ride_details[:name]
    @distance = ride_details[:distance]
    @loop = ride_details[:loop]
    @terrain = ride_details[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop == false then @distance * 2
    else
        @distance
    end
  
  end
end