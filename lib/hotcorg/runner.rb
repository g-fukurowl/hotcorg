# coding: utf-8

require 'timers'

module Hotcorg
    class Runner
        def initialize(options)
            @granularity = options[:granularity]
            @thretholds = options[:threthold]
            @interval = options[:interval]
            @command = options[:command]
            @notify_flag = options[:notify]
            @threhold_flags = []
            @thretholds.each do
                @threhold_flags.push(false)
            end
        end

        def start()
            @timers = Timers::Group.new
            @last_temp = 0
            @timers.every(@interval) {
                current_temp = Hotcorg::Cpu.temp
                react_for_cpu_temp_chang_over_granularity(current_temp)
                react_for_cpu_temp_chang_over_threthold(current_temp)
            }
            loop { @timers.wait }
        end

        def react_for_cpu_temp_chang_over_granularity(current_temp)
            if ((current_temp - @last_temp).abs >= @granularity)
                Hotcorg::Notifier.notify_cpu_temperature(
                    "\" 🐶 CPU temp: #{current_temp}°C\"".encode("UTF-8")) if @notify_flag
                @last_temp = current_temp
                system(@command) if (@command != nil)
            end
        end

        def react_for_cpu_temp_chang_over_threthold(current_temp)
        end
    end
end