

class Biker
    attr_reader :name, :max_distance, :rides, :acceptable_terrains
    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrains = []
    end

    #will learn a terain and add it to the acceptable terrains
    def learn_terrain!(terrain)
        @acceptable_terrains << terrain
    end

    #will log a ride with a time, will not log if it does not match acceptable terrain.
    def log_ride(ride, time)
        if @acceptable_terrains.include?(ride.terrain)
            @rides[ride] =[] unless @rides.key?(ride)
            @rides[ride] << time
        else
            puts "This ride does not match any acceptable terrains"
        end
    end
end