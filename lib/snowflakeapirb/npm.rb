
require_relative "break_module_npm"
module Spreader
    # Get information on an npm package
    class Npm
        def initialize(data) 
            @data = data
        end
       # Get the registry of the package
       # @return [String]
        def registry 
            @data['registry']
        end
       
        # Get an icon url 
        # @return [String]
        def icon
            @data['icon']
        end
        
        # Get url of the package
        # @return [String]
        def url 
            @data['url']
        end
        
        # Get runkit url 
        # @return [String]
        def runkit
            @data['runkit']
        end
        
        # Get module Information
        # @return [Spreader::Break_module_npm]
        def module
           Spreader::Break_module_npm.new(@data)
        end

    end
end