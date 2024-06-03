require './lib/ride'
require './lib/biker'

include Ride

class Biker
  attr_reader :name,
              :acceptable_terrain,
              :max_distance

  def initialize(name, acceptable_terrain)
    @name = name
    @acceptable_terrain = acceptable_terrain
    @max_distance = max_distance 
  end

  it 'has a name' do
    biker = Biker1.new("Kenny")
    name = biker1.name
    expect(name).to eq ("Kenny")
  end  

  it 'has an acceptable_terrain' do
    acceptable_terrain = Acceptable_terrain.new(["gravel", "hills"])
    acceptable_terrain = biker1.acceptable_terrain
    expect(acceptable_terrain).to eq (["gravel", "hills"])
  end  

  it 'has a max distance' do
    max_distance = Max_distance.new(30)
    max_distance = biker2.max_distance
    expect(max_distance).to eq (30)
  end

  if acceptable_terrain && < max_distance
    puts "Completed Ride"
  else
    puts "Couldn't Complete Ride"  
  end  
  # add in ride logs 
  # create method to calculate personal record
  # create method to determine if a ride is in biker's acceptable terrain and less than max distance

  it 'has a name' do
    biker = Biker2.new("Athena")
    name = biker2.name
    expect(name).to eq ("Athena")
  end  

  it 'has an acceptable_terrain' do
    acceptable_terrain = Acceptable_terrain.new(["gravel", "hills"])
    acceptable_terrain = biker2.acceptable_terrain
    expect(acceptable_terrain).to eq (["gravel", "hills"])
  end  

  it 'has a max distance' do
    max_distance = Max_distance.new(65)
    max_distance = biker2.max_distance
    expect(max_distance).to eq (65)
  end

  if acceptable_terrain && < max_distance
    puts "Completed Ride"
  else
    puts "Couldn't Complete Ride"  
  end  
  # add in ride logs 
  # create method to calculate personal record
  # create method to determine if a ride is in biker's acceptable terrain and less than max distance
end