require_relative 'snowflake_info'

module Spreader
    class Token_info 
        def initialize(data)
          @data = data
        end

        def type 
            @data['type']
        end

        def token 
            @data['token']
        end  
          
        def id 
            @data['id']
        end 

        def username 
            @data['username']
        end

        def descriminator 
            @data['descriminator']
        end

        def avatar 
            @data['avatar']
        end

        def avatarURL
            @data['avatarURL']
        end

        def snowflake_info 
            Spreader::Snowflake_info.new(@data)
        end
    end
end