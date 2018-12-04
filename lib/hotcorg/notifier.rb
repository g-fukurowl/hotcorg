# coding: utf-8

require 'rbconfig'

module Hotcorg
    class Notifier
        def self.fire(message)
            host_os = RbConfig::CONFIG['host_os']
            case host_os
            when /darwin|mac os/
                command = "osascript -e 'display notification #{message}'"
                system(command)
            else
                raise "hotcorg does not support platform except for macOS."
            end
        end
    end
end