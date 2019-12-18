require "./spec_helper"

describe AdventOfCode do
  describe "2.2" do
    describe "nouns_and_verbs" do
      it "passes example" do
        AdventOfCode.nouns_and_verbs(File.read("#{__DIR__}/../src/crystal/input/2.txt"), 0..99, 0..99, 3058646).should eq(1202)
      end
    end
  end
end
