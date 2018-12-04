module Hotcorg
    class Notifier
        def self.notify_cpu_temperature(cpu_temp)
            command = "osascript -e 'display notification #{cpu_temp}'"
            system(command)
        end
    end
end