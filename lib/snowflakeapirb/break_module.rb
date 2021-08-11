
module Spreader
    class Break_module
        def initialize(data)
            @data = data['module']
        end

        attr_accessor :data
        alias :raw :data

        def name
            @data['name']
        end

        def url
            @data['url']
        end

        def description
            @data['description']
        end

        def version
            @data['version']
        end

        def stars
            @data['stars']
        end

        def developer_name 
            @data['developer']['name']
        end

        def developer_url
            @data['developer']['url']
        end

        def created_at
            @data['createdAt']
        end
        
        def github
            @data['github']
        end
    end
    
end
