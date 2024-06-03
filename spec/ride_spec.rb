require './lib/ride'

class Ride
  attr_reader :name,
              :distance,
              :loop,
              :terrain

  def initialize(name, distance, loop, terrain)
    @name = name
    @distance = distance
    @loop = loop
    @terrain = terrain 
  end