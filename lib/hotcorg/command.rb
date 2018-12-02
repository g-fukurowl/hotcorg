require 'iStats'


module Hotcorg
    class Command extend CPU_STATS
        def self.cpu_temp
            get_cpu_temp
        end
    end
end