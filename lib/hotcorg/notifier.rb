module Hotcorg
    class Notifier
        def self.notify_cpu_temperature(cpu_temp)
            `osascript -e 'display notification "#{cpu_temp}"'`
        end

        def start(threthold_str)
            if (threthold_str == nil)
                threthold = 1
            else
                threthold = threthold_str.to_f
            end
            timers = Timers::Group.new
            last_temp = 0
            timers.every(1) {
                current_temp = Hotcorg::Cpu.temp
                if ((current_temp - last_temp).abs >= threthold)
                    Hotcorg::Notifier.notify_cpu_temperature(current_temp)
                    last_temp = current_temp
                end
            }
            loop { timers.wait }
        end
    end
end