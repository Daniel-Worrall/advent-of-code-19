require "./spec_helper"

describe AdventOfCode do
  describe "3.1" do
    describe AdventOfCode::WirePath do
      it "parses input" do
        AdventOfCode::WirePath.new("R8,U5,L5,D3").print.should eq(
          "...........\n" \
          "....xxxxxx.\n" \
          "....x....x.\n" \
          "....x....x.\n" \
          "....x....x.\n" \
          ".........x.\n" \
          ".xxxxxxxxx.\n" \
          "..........."
        )
        AdventOfCode::WirePath.new("U7,R6,D4,L4").print.should eq(
          ".........\n" \
          ".xxxxxxx.\n" \
          ".x.....x.\n" \
          ".x.....x.\n" \
          ".x.....x.\n" \
          ".x.xxxxx.\n" \
          ".x.......\n" \
          ".x.......\n" \
          ".x.......\n" \
          "........."
        )
      end

      it "finds intersections" do
        AdventOfCode::WirePath.new("R8,U5,L5,D3").intersections(AdventOfCode::WirePath.new("U7,R6,D4,L4")).should eq([{0, 0}, {3, 3}, {6, 5}].to_set)
      end
    end

    describe AdventOfCode::Manhatten do
      it "passes example" do
        AdventOfCode::Manhatten.new("R8,U5,L5,D3\nU7,R6,D4,L4").closest_intersection.should eq 6
        AdventOfCode::Manhatten.new("R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83").closest_intersection.should eq 159
        AdventOfCode::Manhatten.new("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7").closest_intersection.should eq 135
      end
    end
  end
end
