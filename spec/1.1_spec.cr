require "./spec_helper"

describe AdventOfCode do
  describe "1.1" do
    describe "mass_of_fuel" do
      it "passes example" do
        AdventOfCode.mass_of_fuel(12).should eq 2
        AdventOfCode.mass_of_fuel(14).should eq 2
        AdventOfCode.mass_of_fuel(1969).should eq 654
        AdventOfCode.mass_of_fuel(100756).should eq 33583
      end
    end
  end
end
