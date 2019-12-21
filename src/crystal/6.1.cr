module AdventOfCode
  class StarMap
    property orbit_map = {} of String => String

    def initialize(input)
      input.each_line.map(&.split(")")).each do |(orbitee, orbiter)|
        orbit_map[orbiter] = orbitee
      end
    end

    def orbits(star)
      count = 0
      orbiter = star
      while orbiter = orbit_map[orbiter]?
        count += 1
      end
      count
    end

    def total_orbits
      orbit_map.keys.sum(&->orbits(String))
    end
  end

  extend self

  def run_6_1
    AdventOfCode::StarMap.new(File.read("#{__DIR__}/input/6.txt")).total_orbits
  end
end
