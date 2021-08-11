
module Spreader
    class Meme
        def initialize(data)
            @data = data
        end

        attr_accessor :data
        alias_method :raw, :data

        def is_video 
            @data['isVideo']
        end
        
        def nsfw
          @data['nsfw']
        end

        def url 
            @data['url']
        end

        def created_at
            @data['createdAt']
        end

        def upvotes
            @data['ratings']['upvote']
        end

        def downvote
            @data['ratings']['downvote']
        end

        def comments 
            @data['ratings']['comments']
        end

        def subreddit
            @data['subreddit']
        end

        def title
            @data['title']
        end

        def link
            @data['link']
        end
    end
end