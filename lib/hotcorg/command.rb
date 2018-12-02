require 'timers'

module Hotcorg
    class Command
        def self.execute
            timers = Timers::Group.new
            timers.every(2) { puts Hotcorg::Cpu.get_cpu_temp }
            loop { timers.wait }
        end
    end
end