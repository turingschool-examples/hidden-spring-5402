class Biker
  attr_reader :name,
              :rides,
              :max_distance,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @rides = Hash.new([])
    @acceptable_terrain = []
    @max_distance = max_distance
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
      @rides[:ride] << time
    end
    binding.pry
  end

end