require_relative "break_module"
module Spreader
    class Deno 
        def initialize(data) 
            @data = data
        end

        attr_accessor :data
        alias_method :raw, :data

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
            Spreader::Break_module.new(@data)
        end

    end
end