module AdventOfCode
  alias Asteroid = Tuple(Int32, Int32)

  class AsteroidField
    property field : Set(Asteroid)

    def self.from_map(input : String)
      field = Set(Asteroid).new
      input.each_line.with_index do |line, i|
        line.chars.each_with_index do |char, j|
          field << {j, i} if char == '#'
        end
      end
      self.new(field)
    end

    def initialize(@field)
    end

    def visible_asteroids_num(from : Asteroid) : Int32
      field.count do |to|
        line_of_sight?(from, to)
      end - 1
    end

    def line_of_sight?(from : Asteroid, to : Asteroid)
      x_diff = to[0] - from[0]
      y_diff = to[1] - from[1]
      gcd = x_diff.gcd(y_diff)
      return true if gcd == 1
      return false if (1..gcd - 1).any? do |num|
                        field.includes?({from[0] + num * x_diff // gcd, from[1] + num * y_diff // gcd})
                      end
      true
    end
  end

  extend self

  def run_10_1
    field = AdventOfCode::AsteroidField.from_map(File.read("#{__DIR__}/input/10.txt"))
    field.field.max_of do |asteroid|
      field.visible_asteroids_num(asteroid)
    end
  end
end
