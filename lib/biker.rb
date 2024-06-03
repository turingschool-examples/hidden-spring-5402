class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain unless @acceptable_terrain.include?(terrain)
  end

  def log_ride(ride, time)
    @rides[ride] ||= []
    @rides[ride] << time
  end

  def personal_record(ride)
    times = @rides[ride]
    times ? times.min : false
  end

end