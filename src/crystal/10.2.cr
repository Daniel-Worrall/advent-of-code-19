module AdventOfCode
  class AsteroidField
    def visible_asteroids(from : Asteroid)
      field.select do |to|
        line_of_sight?(from, to)
      end
    end

    def blow_up(from)
      blown_up = [] of Asteroid
      until field == Set(Asteroid).new([from])
        visible_asteroids(from).sort { |a, b| fake_bearing(from, a) <=> fake_bearing(from, b) }.each do |asteroid|
          next if asteroid == from
          blown_up << asteroid
          field.delete(asteroid)
        end
      end
      blown_up
    end

    private def fake_bearing(from, to)
      bearing({from[0], -from[1]}, {to[0], -to[1]})
    end

    private def bearing(from, to)
      Math.atan2(to[0] - from[0], to[1] - from[1]) % (2 * Math::PI)
    end
  end

  extend self

  def run_10_2
    field = AdventOfCode::AsteroidField.from_map(File.read("#{__DIR__}/input/10.txt"))
    station = field.field.max_by do |asteroid|
      field.visible_asteroids_num(asteroid)
    end
    blown_up = field.blow_up(station)
    blown_up[199][0] * 100 + blown_up[199][1]
  end
end
