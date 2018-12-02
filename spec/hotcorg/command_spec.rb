require "spec_helper"

module Hotcorg
    describe Command do
        it "can print cpu temperature" do
            expect(Command.cpu_temp).not_to be nil
          end
    end
end
