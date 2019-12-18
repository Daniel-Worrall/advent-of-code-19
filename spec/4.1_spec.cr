require "./spec_helper"

describe AdventOfCode do
  describe "4.1" do
    describe "valid_password?" do
      it "passes example" do
        AdventOfCode.valid_password?(111111).should eq true
        AdventOfCode.valid_password?(223450).should eq false
        AdventOfCode.valid_password?(123789).should eq false
      end
    end

    describe "skip_invalid_password" do
      it "passes example" do
        AdventOfCode.skip_invalid_password(111111).should eq 0
        AdventOfCode.skip_invalid_password(223450).should be_truthy
        AdventOfCode.skip_invalid_password(123789).should be_truthy
      end

      it "skips descending values" do
        AdventOfCode.skip_invalid_password(2231).should eq 2
        AdventOfCode.skip_invalid_password(22314).should eq 20
      end

      it "skips non-doubles" do
        AdventOfCode.skip_invalid_password(2345).should eq 10
      end
    end

    describe "number_of_skips" do
      it "passes" do
        AdventOfCode.number_of_valid_passwords(100, 200).should eq 100.upto(200).count { |element| AdventOfCode.valid_password?(element) }
      end
    end
  end
end
