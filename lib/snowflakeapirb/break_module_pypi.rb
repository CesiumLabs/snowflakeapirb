
module Spreader
    class Break_module_pypi
        def initialize(data)
            @data = data['module']
        end

        def name 
            @data['name']
        end

        def description
            @data['description']
        end

        def url 
            @data['url']
        end

        def version
            @data['version']
        end

        def author 
            @data['author']
        end 

        def updated_at
            @data['updatedAt']
        end

        def documentation
            @data['documentation']
        end

        def homepage
            @data['homepage']
        end 

    end
end