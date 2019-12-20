describe AdventOfCode do
  describe "6.1" do
    describe AdventOfCode::StarMap do
      map = "COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L"
      it "passes example" do
        starmap = AdventOfCode::StarMap.new(map)
        starmap.orbits("D").should eq 3
        starmap.orbits("L").should eq 7
        starmap.orbits("COM").should eq 0
        starmap.total_orbits.should eq 42
      end

      it "intializes starmap" do
        starmap = AdventOfCode::StarMap.new(map)
        starmap.orbit_map["B"].should eq "COM"
        starmap.orbit_map["L"].should eq "K"
      end
    end
  end
end
