class Ride
attr_reader :name,
            :distance,
            :loop,
            :terrain,
            :total_distance

  def initialize(ride_info)
    @name = ride_info[:name]
    @distance = ride_info[:distance]
    @loop = ride_info[:loop]
    @terrain = ride_info[:terrain]
    @total_distance = total_distance
  end

  def loop?
    @loop
  end

  def total_distance
    if !loop?
      @total_distance = @distance * 2
    else
      @total_distance = @distance
    end
  end
end