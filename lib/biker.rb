

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
        if @acceptable_terrains.include?(ride.terrain) && self.max_distance >= ride.total_distance
            @rides[ride] =[] unless @rides.key?(ride)
            @rides[ride] << time
            puts "#{self.name} knows this terrain and can bike this distance."

        elsif !@acceptable_terrains.include?(ride.terrain)
            puts "#{self.name} does not know this terrain yet."
            
        elsif self.max_distance < ride.total_distance
            puts "#{self.name} cannot ride that far."
        end
    end

    #will look for the .min time in the rides hash for the ride
    def personal_record_for(ride)
        @rides[ride].min
    end
end