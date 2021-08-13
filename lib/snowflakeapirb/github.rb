
module Spreader
    # Class that spreads the Github Statstics endpoint
    class Github_Stats
        def initialize(data)
            @data = data
        end
        
        # Returns the name of the user
        # @return [String]
        def name 
            @data['name']
        end
        
        # Returns the avatar url of the user 
        # @return [String]
        def avatar
            @data['avatar']
        end
        
        # Returns the number of followers
        # @return [Number]
        def followers
            @data['followers']
        end
       
        # Returns the number of repositories
        # @return [Number]
        def repos
            @data['repos']
        end
        
        # Returns the number of pull_requests by the user 
        # @return [Number]
        def pull_requests
            @data['pullRequests']
        end
       
        # Returns the number of issues opened by the user 
        # @return [Number]
        def issues
            @data['issues']
        end
       
        # Returns the number of npm downloads by the user 
        # @return [Number]
        def npm_downloads
            @data['npmDownloads']
        end
    end
end