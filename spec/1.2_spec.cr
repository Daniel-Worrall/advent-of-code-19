require "./spec_helper"

describe AdventOfCode do
  describe "1.2" do
    describe "recursive_mass_of_fuel" do
      it "passes example" do
        AdventOfCode.recursive_mass_of_fuel(14).should eq 2
        AdventOfCode.recursive_mass_of_fuel(1969).should eq 966
        AdventOfCode.recursive_mass_of_fuel(100756).should eq 50346
      end
    end
  end
end
