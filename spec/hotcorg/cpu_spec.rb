require "spec_helper"

module Hotcorg
    describe Cpu do
        it "can get cpu temp (> 0 degree)" do
            expect(Hotcorg::Cpu.temp).to be > 0
        end
    end
end
