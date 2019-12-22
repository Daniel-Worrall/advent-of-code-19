require "./spec_helper"

describe AdventOfCode do
  describe "9" do
    describe AdventOfCode::Intcode do
      it "passes example" do
        program = "109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99"
        AdventOfCode::Int64code.new(program).run.output.join(",").should eq program

        program = "1102,34915192,34915192,7,4,7,99,0"
        AdventOfCode::Int64code.new(program).run.output[-1].to_s.size.should eq 16

        program = "104,1125899906842624,99"
        AdventOfCode::Int64code.new(program).run.output[-1].should eq 1125899906842624
      end
    end
  end
end
