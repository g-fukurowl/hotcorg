# coding: utf-8

require 'timers'

module Hotcorg
    class Runner
        def initialize(options)
            @granularity = options[:granularity]
            @thretholds = options[:threthold].sort.map(&:to_f)
            @interval = options[:interval]
            @command = options[:command]
            @notify_flag = options[:notify]
            @threhold_info = []
            @thretholds.each do |t|
                elem = {val: t, flag: false}
                @threhold_info.push(elem)
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
                Hotcorg::Notifier.fire(
                    "\" 🐶 CPU temp: #{current_temp}°C\"".encode("UTF-8")) if @notify_flag
                @last_temp = current_temp
                system(@command) if (@command != nil)
            end
        end

        def react_for_cpu_temp_chang_over_threthold(current_temp)
            is_fired = false
            # threhold_info is already sorted (ex.:[10, 8, 11] => [8, 10, 11])
            @threhold_info.reverse_each do |e|
                if (e[:flag] == true) && (e[:val] <= current_temp)
                    next
                end
                if (e[:flag] == true) && (e[:val] > current_temp)
                    e[:flag] = false
                    next
                end
                if (e[:flag] == false) && (e[:val] <= current_temp)
                    e[:flag] = true
                    if (is_fired == false)
                        Hotcorg::Notifier.fire(
                            "\" 🐶🔥 CPU temp got #{e[:val]}°C\"".encode("UTF-8")) if @notify_flag
                        is_fired = true
                    end
                end
            end
            @last_temp = current_temp
        end
    end
end