require 'timers'
require 'thor'

module Hotcorg
    class Command < Thor
        desc "go THRETHOLD", "start process to watch cpu temperature"
        option :threthold
        def go
            notifier = Hotcorg::Notifier.new()
            notifier.start(options[:threthold])
        end
    end
end