require 'timers'
require 'thor'

module Hotcorg
    class Command < Thor
        desc "go THRETHOLD", "start process to watch cpu temperature"
        option :threthold, :type => :numeric, :default => 1
        option :interval, :type => :numeric, :default => 5
        option :command, :type => :string, :default => nil
        option :notify, :type => :boolean, :default => true
        def go
            Hotcorg::Runner.new().start(
                options[:threthold],
                options[:interval],
                options[:command],
                options[:notify])
        end
    end
end