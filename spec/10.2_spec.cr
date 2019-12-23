require "./spec_helper"

describe AdventOfCode do
  describe "10.1" do
    describe AdventOfCode::AsteroidField do
      describe "blown_up" do
        it "passes example" do
          map =
            ".#..##.###...#######\n" \
            "##.############..##.\n" \
            ".#.######.########.#\n" \
            ".###.#######.####.#.\n" \
            "#####.##.#.##.###.##\n" \
            "..#####..#.#########\n" \
            "####################\n" \
            "#.####....###.#.#.##\n" \
            "##.#################\n" \
            "#####.##.###..####..\n" \
            "..######..##.#######\n" \
            "####.##.####...##..#\n" \
            ".#####..#.######.###\n" \
            "##...#.##########...\n" \
            "#.##########.#######\n" \
            ".####.#.###.###.#.##\n" \
            "....##.##.###..#####\n" \
            ".#.#.###########.###\n" \
            "#.#.#.#####.####.###\n" \
            "###.##.####.##.#..##\n"
          blown_up = AdventOfCode::AsteroidField.from_map(map).blow_up({11, 13})
          blown_up[0].should eq ({11, 12})
          blown_up[1].should eq ({12, 1})
          blown_up[2].should eq ({12, 2})
          blown_up[9].should eq ({12, 8})
          blown_up[19].should eq ({16, 0})
          blown_up[49].should eq ({16, 9})
          blown_up[99].should eq ({10, 16})
          blown_up[198].should eq ({9, 6})
          blown_up[199].should eq ({8, 2})
          blown_up[200].should eq ({10, 9})
          blown_up[298].should eq ({11, 1})
          blown_up.size.should eq 299
        end
      end
    end
  end
end
