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
K)L
K)YOU
I)SAN"
      it "passes example" do
        starmap = AdventOfCode::StarMap.new(map).orbit_jumps("YOU", "SAN").should eq 4
      end
    end
  end
end
