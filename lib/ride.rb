class Ride
  attr_reader :name,
              :loop,
              :terrain,
              :distance

  def initialize(info)
    @name = info[:name]
    @loop = info[:loop]
    @terrain = info[:terrain]
    @distance = info[:distance]
  end

  def loop?
    @loop
  end

  def total_distance
    if loop? == false
      @distance * 2
    else
      @distance
    end
  end
end