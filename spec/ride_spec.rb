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


  it 'has a name' do
    ride = Ride1.new('Walnut Creek Trail')
    name = ride1.name
    expect(name).to eq ('Walnut Creek Trail')
  end  

  it 'has a distance' do
    distance = Distance.new(10.7)
    distance = ride1.distance
    expect(distance).to eq (10.7)
  end  

  it 'is a loop' do
    loop = Loop.new(false)
    distance = trail.distance
    expect(loop).to eq (false)
  end  

  it 'has terrain' do
    terrain = Terrain.new('hills')
    terrain = ride1.terrain
    expect(terrain).to eq ('hills')
  end  


  it 'has a total distance' do
    distance = Total_Distance.new(21.4)
    distance = ride1.distance
    expect(distance).to eq (21.4)
  end  


  it 'has a name' do
    ride = Ride2.new('Town Lake')
    name = ride2.name
    expect(name).to eq ('Town Lake')
  end  

  it 'has a distance' do
    distance = Distance.new(14.9)
    distance = ride2.distance
    expect(distance).to eq (14.9)
  end  

  it 'is a loop' do
    loop = Loop.new(true)
    distance = ride2.distance
    expect(loop).to eq (true)
  end  

  it 'has terrain' do
    terrain = Terrain.new('gravel')
    terrain = ride2.terrain
    expect(terrain).to eq ('gravel')
  end  


  it 'has a total distance' do
    distance = Total_Distance.new(14.9)
    distance = ride2.distance
    expect(distance).to eq (14.9)
  end  
