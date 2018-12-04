# coding: utf-8

require 'thor'

module Hotcorg
    class Command < Thor
        desc "go", "start watching a cpu temperature change (Enter Ctrl-C to stop)"
        option :granularity, :type => :numeric, :default => 1, :aliases => '-g', :desc => 'Granularity for change in CPU temperature at which hotcorg should react [°C]'
        option :interval, :type => :numeric, :default => 5, :aliases => '-i', :desc => 'Interval when hotcorg checks CPU temperature change [Sec.]'
        option :command, :type => :string, :default => nil, :aliases => '-c', :desc => 'Command to be executed each time hotcorg detects CPU temperature change'
        option :notify, :type => :boolean, :default => true, :aliases => '-n', :desc => 'Whether hotcorg notifies CPU temperature change (supported only with macOS)'
        def go
            Hotcorg::Runner.new().start(
                options[:granularity],
                options[:interval],
                options[:command],
                options[:notify])
        end
    end
end