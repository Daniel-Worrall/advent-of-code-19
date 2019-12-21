require "./spec_helper"

describe AdventOfCode do
  describe "8.1" do
    describe AdventOfCode::Image do
      describe "self.from_sif" do
        it "passes example" do
          AdventOfCode::Image.from_sif(3, 2, "123456789012").layers.should eq [[1, 2, 3, 4, 5, 6], [7, 8, 9, 0, 1, 2]]
        end
      end
    end
  end
end
