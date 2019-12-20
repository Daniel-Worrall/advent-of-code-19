module AdventOfCode
  class StarMap
    def orbit_tree(orbiter)
      tree = Set(String).new
      while orbiter = orbit_map[orbiter]?
        tree << orbiter
      end
      tree
    end

    def orbit_jumps(from, to)
      orbits(from) + orbits(to) - 2 * (orbits((orbit_tree(from) & orbit_tree(to)).first) + 1)
    end
  end

  extend self

  def run_6_2
    AdventOfCode::StarMap.new(File.read("#{__DIR__}/input/6.txt")).orbit_jumps("YOU", "SAN")
  end
end
