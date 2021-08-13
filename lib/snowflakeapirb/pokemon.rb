
module Spreader

    # Class that spreads the pokemon endpoint
    class Pokemon
        def initialize(data) 
            @data = data
        end

        attr_accessor :data

        alias_method :raw, :data
        
        # Returns the name of the Pokemon
        # @return [String]
        def name
            @data['name']
        end
       
        # Returns the id of the Pokemon
        # @return [Number]
        def id
            @data['id']
        end
        
        # Returns the base_experience of the pokemon 
        # @return [String]
        def base_experience
            @data['baseExperience']
        end
        
        # Returns the height of the pokemon
        def height
            @data['height']
        end
        
        # Returns the weight of the pokemon
        # @return [Number]
        def weight
            @data['weight']
        end
        # Returns the type of Pokemon
        # @return [String]
        def type
            @data['type']
        end
        
        # Returns the moves of the pokemon 
        # @return [Array]
        def moves
            @data['moves']
        end
        
        # Returns the stats of the Pokemon
        # @return [Array]
        def stats
            @data['stats']
        end
       
        # Returns the image of the pokemon 
        # @return [String]
        def image
            @data['image']
        end
        
    end
end