require 'iStats'

module Hotcorg
    class Cpu extend CPU_STATS
        def self.temp
            get_cpu_temp
        end
    end
end