class Ride
    attr_reader :name,
                :distance,
                :loop,
                :terrain

    def initialize(features)
        @name = features[:name]
        @distance = features[:distance]
        @loop = features[:loop]
        @terrain = features[:terrain]
    end

    def loop?
        @loop
    end

    def total_distance
        if @loop
            actual_distance = distance
        else
            actual_distance = distance * 2
        end
        actual_distance
    end

end