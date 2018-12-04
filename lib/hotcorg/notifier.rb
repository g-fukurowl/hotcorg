require 'rbconfig'

module Hotcorg
    class Notifier
        def self.notify_cpu_temperature(cpu_temp)
            host_os = RbConfig::CONFIG['host_os']
            case host_os
            when /darwin|mac os/
                message = "\"CPU temp: #{cpu_temp}°C\""
                command = "osascript -e 'display notification #{message}'"
                system(command)
            else
                raise "hotcorg does not support platform except for macOS."
            end
        end
    end
end