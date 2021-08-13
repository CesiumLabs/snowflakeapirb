
module Spreader
    class Break_module_npm
        def initalize(data)
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

        def main
            @data['main']
        end

        def license
            @data['license']
        end

        def author
            @data['author']
        end

        def maintainers
            @data['maintainers']
        end

        def dependencies
            @data['dependencies']
        end

        def repository_type
            @data['repository']['type']
        end

        def repository_url
            @data['repository']['url']

        end

        def banner
            @data['banner']
        end
    
    end
end