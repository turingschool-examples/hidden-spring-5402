class Biker
    attr_reader :name,
                :max_distance,
                :rides,
                :acceptable_terrain

    def initialize(name, max_distance)
        @name = name
        @max_distance = max_distance
        @rides = {}
        @acceptable_terrain = []
    end

    def learn_terrain!(terrain)
        @acceptable_terrain << terrain
    end

    def log_ride(ride, ride_distance)
       if @rides.key?(ride)
        @rides[ride] << ride_distance
       else
        @rides[ride] = [ride_distance]
       end
        # binding.pry
    end

    def personal_record(ride)
       return nil unless @rides.has_key?(ride)
        @rides[ride].min               
    end

    # def knows_terrain_and_can_log
    #     if @biker.learn_terrain! 


    #     # biker2 doesn't know terrain so 
    #     # biker2 hash is empty
    #     # biker2 learns terrain then adds ride to empty hash
    #     #but biker2 can only add to hash ride distance they know
    #     # biker2 hash should only have ride2/65.0
    # end

end