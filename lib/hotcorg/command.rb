require 'timers'
require 'thor'

module Hotcorg
    class Command < Thor
        desc "go THRETHOLD", "start process to watch cpu temperature"
        option :threthold
        def go
            if (options[:threthold] == nil)
                threthold = 1
            else
                threthold = options[:threthold].to_f
            end
            timers = Timers::Group.new
            last_temp = 0
            timers.every(5) {
                current_temp = Hotcorg::Cpu.get_cpu_temp
                if ((current_temp - last_temp).abs >= threthold)
                    puts current_temp
                    last_temp = current_temp
                end
            }
            loop { timers.wait }
        end
    end
end