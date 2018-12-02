require 'timers'
require 'thor'

module Hotcorg
    class Command < Thor
        def self.execute
            timers = Timers::Group.new
            timers.every(2) { puts Hotcorg::Cpu.get_cpu_temp }
            loop { timers.wait }
        end

        desc "list GITHUB_TOKEN", "List repositories"
        option :threthold
        def go
            timers = Timers::Group.new
            timers.every(2) { puts Hotcorg::Cpu.get_cpu_temp }
            loop { timers.wait }
        end
    end
end