require "./spec_helper"

describe AdventOfCode do
  describe "3.2" do
    describe AdventOfCode::Manhatten do
      it "passes example" do
        AdventOfCode::Manhatten.new("R8,U5,L5,D3\nU7,R6,D4,L4").minimal_signal_delay.should eq 30
        AdventOfCode::Manhatten.new("R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83").minimal_signal_delay.should eq 610
        AdventOfCode::Manhatten.new("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7").minimal_signal_delay.should eq 410
      end
    end
  end
end
