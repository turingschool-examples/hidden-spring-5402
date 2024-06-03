

class Ride
    attr_reader :name, :distance, :loop, :terrain
    
    def initialize(details)
        @name = details[:name]
        @distance = details[:distance]
        @loop = details[:loop]
        @terrain = details[:terrain]
    end

    def loop?
        @loop
    end

        #if loop is false, the total distance is doubled
    def total_distance
        if @loop == false
            @distance.to_f * 2 
        else
            @distance.to_f
        end
    end

end