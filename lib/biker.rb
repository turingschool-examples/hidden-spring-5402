class Biker
attr_reader :name,
            :max_distance            

attr_accessor :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    @rides.merge {|ride, time| [time] << time}
  end
end