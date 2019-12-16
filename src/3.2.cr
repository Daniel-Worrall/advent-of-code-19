module AdventOfCode
  class Manhatten
    def minimal_signal_delay
      (paths[0].intersections(paths[1]) - [{0, 0}]).min_of { |coords| paths[0].distance[coords] + paths[1].distance[coords] }
    end
  end

  extend self

  def run_3_2
    AdventOfCode::Manhatten.new(File.read("#{__DIR__}/input/3.txt")).minimal_signal_delay
  end
end
