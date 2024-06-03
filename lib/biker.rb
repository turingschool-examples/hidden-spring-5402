class Biker
  attr_reader :name, 
              :max_distance, 
              :rides, 
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = Hash.new()
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  #this method took me an hour to solve. lordy that was hard!!
  def log_ride(ride_object, time)
    if @rides.keys.include?(ride_object)
      @rides[ride_object] << time
    else
      @rides[ride_object] = [time]
    end
  end
end