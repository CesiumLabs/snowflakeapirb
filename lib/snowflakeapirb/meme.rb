
module Spreader
    # Class to get information on a meme from the subreddit
    class Meme
        def initialize(data)
            @data = data
        end
       
        attr_accessor :data
        alias_method :raw, :data
       
        # True/False if video or not
        # @return [Boolean]
        def is_video? 
            @data['isVideo']
        end
        
        # Is nsfw or not
        # @return [Boolean]
        def nsfw?
          @data['nsfw']
        end
        
        # Meme url
        # @return [String]
        def url 
            @data['url']
        end
        
        # Created At Date
        # @return [String]
        def created_at
            @data['createdAt']
        end
        
        # Return number of upvotes 
        # @return [Number]
        def upvotes
            @data['ratings']['upvote']
        end
        
        # Returns the number of downvotes
        # @return [Number]
        def downvote
            @data['ratings']['downvote']
        end
        
        # Return the comments of the post 
        # @return [Array]
        def comments 
            @data['ratings']['comments']
        end
        
        # Get subreddit of the meme 
        # @return [String]
        def subreddit
            @data['subreddit']
        end
        
        # Returns the title of the meme 
        # @return [Number]
        def title
            @data['title']
        end
        # Returns the link of the Meme
        # @return [String]
        def link
            @data['link']
        end
    end
end