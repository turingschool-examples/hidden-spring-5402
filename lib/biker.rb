class Biker
    attr_reader :name, :acceptable_terrain, :max_distance

    def name
    end 
    
    def acceptable_terrain
    end

    def max_distance
    end
end

biker1 = Biker1.new({name: "Kenny", acceptable_terrain: ["gravel", "hills"] , max_distance: 30})
biker2 = Biker2.new({name: "Athena", acceptable_terrain: ["gravel", "hills"], max_distance: 65})