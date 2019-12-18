require "./spec_helper"

describe AdventOfCode do
  describe "4.2" do
    describe "valid_password_two?" do
      it "passes example" do
        AdventOfCode.valid_password_two?(112233).should eq true
        AdventOfCode.valid_password_two?(123444).should eq false
        AdventOfCode.valid_password_two?(111122).should eq true
      end
    end
  end
end
