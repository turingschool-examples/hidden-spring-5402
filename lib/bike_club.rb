

class BikeClub
    attr_accessor :bikers
    attr_reader :name, :bikers

    def initialize(name)
        @name = name
        @bikers = []
    end

    def add_biker(biker)
        @bikers << biker
    end
    
    #checks bikers rides by accessing @bikers, and returns the biker with the most rides. max_by is a method that returns the element that has the maximum value of the block.
    def most_rides
        @bikers.max_by do |biker|
            biker.rides.length
        end
    end

    #checks bikers best_time by accessing @bikers, and returns the biker with the best time. min_by is a method that returns the element that has the minimum value of the block.
    def best_time(ride)
        @bikers.min_by do |biker|
            biker.personal_record_for(ride)
        end
    end
end