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

  def log_ride(ride_object, time)
    if @acceptable_terrain.include?(ride_object.terrain) && ride_object.total_distance <= @max_distance
      if @rides.keys.include?(ride_object)
        @rides[ride_object] << time
      else
        @rides[ride_object] = [time]
      end
    end
  end

  def personal_record(ride_object)
    if @rides.keys.include?(ride_object)
      desired_ride = @rides.select do |ride, time_array|
        ride_object == ride
      end
      desired_ride.values.min.min
    else
      false
    end
  end
end