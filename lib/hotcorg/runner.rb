# coding: utf-8

require 'timers'

module Hotcorg
    class Runner
        def start(granularity, interval, command, notify_flag)
            @timers = Timers::Group.new
            @last_temp = 0
            @timers.every(interval) {
                current_temp = Hotcorg::Cpu.temp
                if ((current_temp - @last_temp).abs >= granularity)
                    Hotcorg::Notifier.notify_cpu_temperature(current_temp) if notify_flag
                    @last_temp = current_temp
                    system(command) if (command != nil)
                end
            }
            loop { @timers.wait }
        end
    end
end