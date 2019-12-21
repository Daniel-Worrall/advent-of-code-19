require "./spec_helper"

describe AdventOfCode do
  describe "5.1" do
    describe AdventOfCode::Intcode do
      it "passes example" do
        AdventOfCode::Intcode.new("1,0,0,0,99").run.state.join(",").should eq("2,0,0,0,99")
        AdventOfCode::Intcode.new("2,3,0,3,99").run.state.join(",").should eq("2,3,0,6,99")
        AdventOfCode::Intcode.new("2,4,4,5,99,0").run.state.join(",").should eq("2,4,4,5,99,9801")
        AdventOfCode::Intcode.new("1,1,1,4,99,5,6,0,99").run.state.join(",").should eq("30,1,1,4,2,5,6,0,99")

        AdventOfCode::Intcode.new("1,9,10,3,2,3,11,0,99,30,40,50").run.state.join(",").should eq("3500,9,10,70,2,3,11,0,99,30,40,50")
      end

      it "inputs" do
        intcode = AdventOfCode::Intcode.new("3,0,99")
        intcode.run(50)
        intcode.state[0].should eq 50
      end

      it "outputs" do
        AdventOfCode::Intcode.new("4,0,99").run(0)[-1].should eq 4
      end

      it "inputs and outputs" do
        AdventOfCode::Intcode.new("3,0,4,0,99").run(50)[-1].should eq 50
      end
    end
  end
end
