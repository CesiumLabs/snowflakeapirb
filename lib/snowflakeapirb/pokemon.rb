
module Spreader
    class Pokemon
        def initialize(data) 
            @data = data
        end

        attr_accessor :data
        
        alias_method :raw, :data

        def name
            @data['name']
        end

        def id
            @data['id']
        end

        def base_experience
            @data['baseExperience']
        end

        def height
            @data['height']
        end

        def weight
            @data['weight']
        end

        def type
            @data['type']
        end

        def moves
            @data['moves']
        end

        def stats
            @data['stats']
        end

        def image
            @data['image']
        end
        
    end
end