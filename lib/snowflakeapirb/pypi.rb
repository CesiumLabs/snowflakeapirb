require_relative 'break_module_pypi'

module Spreader
    class Pypi 
        def initialize(data)
            @data = data
        end

        def registry
            @data['registry']
        end

        def icon
            @data['icon']
        end

        def url 
            @data['url']
        end

        def module 
            Spreader::Break_module_pypi.new(@data)
        end
    end
end