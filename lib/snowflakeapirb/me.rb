
module Spreader
    class Me
        def initialize(data)
            @data = data
        end

        def user
            @data['user']
        end

        def pro
            @data['pro']
        end

        def banned?
            @data['banned']
        end

        def ratelimits
            @data['ratelimits']
        end

        def requests 
            @data['requests']
        end

        def token_created_timestamp
            @data['tokenCreatedTimestamp']
        end

        def created_timestamp
            @data['created_timestamp']
        end

        
    end
end