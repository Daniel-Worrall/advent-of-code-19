module AdventOfCode
  class Image
    property width : Int32
    property height : Int32
    property layers : Array(Array(Int32))

    def self.from_sif(width, height, input)
      self.new(width, height, input.chars.map(&.to_i).in_groups_of(width * height, filled_up_with: 2))
    end

    def initialize(@width, @height, @layers)
    end
  end

  extend self

  def run_8_1
    tally = AdventOfCode::Image.from_sif(25, 6, File.read("#{__DIR__}/input/8.txt")).layers.min_by(&.tally[0]).tally
    tally[1] * tally[2]
  end
end
