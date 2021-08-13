
module Spreader
    class Snowflake_info 
        def initialize(data)
            @data = data['snowflakeInfo']
        end

        def epoch
            @data['epoch']
        end

        def timestamp
            @data['timestamp']
        end

        def worker_id
            @data['workerID']
        end

        def process_id
            @data['processID']
        end

        def increment
            @data['increment']
        end

        def binary
            @data['binary']
        end

        def date 
            @data['date']
        end  

        def snowflake
            @data['snowflake']
        end
        
    end
end