require "./spec_helper"

describe AdventOfCode do
  describe "8.2" do
    describe AdventOfCode::Image do
      describe "render" do
        it "passes example" do
          AdventOfCode::Image.from_sif(2, 2, "0222112222120000").render.should eq "\n\e[30m█\e[0m\e[37m█\e[0m\n\e[37m█\e[0m\e[30m█\e[0m"
        end
      end
    end
  end
end
