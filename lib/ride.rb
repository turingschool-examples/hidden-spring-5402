class Ride
    attr_reader :name, :distance, :terrain

    def initialize(hash)
        @name = hash[:name]
        @distance = hash[:distance]
        @terrain = hash[:terrain]
        @loop = hash[:loop]
    end

    def loop?
        @loop
    end

    def total_distance
        if loop?
            @distance
        else
            @distance * 2
        end
    end
end