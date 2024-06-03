class BikeClub
  attr_reader :name, :bikers
  
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_bikers(biker)
    @bikers << biker
  end

  def most_rides
    hash = Hash.new(0)
    @bikers.each do |biker|
      hash[biker] = biker.rides.values.flatten.count
    end
    value = hash.max_by do |biker_object, ride_count|
      ride_count
    end
    value[0].name
  end
end