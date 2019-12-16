module AdventOfCode
  class WirePath
    property path : Set(Tuple(Int32, Int32)) = [{0, 0}].to_set

    def initialize(input)
      x_coord = 0
      y_coord = 0
      input.split(",").each do |direction_distance|
        direction = direction_distance[0]
        distance = direction_distance[1..].to_i
        case direction
        when 'R'
          distance.times do |val|
            path.add({(x_coord + val), y_coord})
          end
          x_coord += distance
        when 'L'
          distance.times do |val|
            path.add({(x_coord - val), y_coord})
          end
          x_coord -= distance
        when 'U'
          distance.times do |val|
            path.add({x_coord, (y_coord + val)})
          end
          y_coord += distance
        when 'D'
          distance.times do |val|
            path.add({x_coord, (y_coord - val)})
          end
          y_coord -= distance
        else
          raise "Cannot parse #{direction} (#{direction_distance})"
        end
      end
      path.add({x_coord, y_coord})
    end

    def print
      String.build do |str|
        (path.max_of { |coords| coords[1] } + 1).downto(path.min_of { |coords| coords[1] } - 1) do |y_coord|
          (path.min_of { |coords| coords[0] } - 1).upto(path.max_of { |coords| coords[0] } + 1) do |x_coord|
            str << (path.includes?({x_coord, y_coord}) ? "x" : ".")
          end
          str << "\n"
        end
      end.chomp
    end

    def intersections(wire : WirePath)
      path & wire.path
    end
  end

  class Manhatten
    property paths = [] of WirePath

    def initialize(input)
      input.each_line do |line|
        paths << WirePath.new(line)
      end
    end

    def closest_intersection
      (paths[0].intersections(paths[1]) - [{0, 0}]).min_of { |coords| coords[0].abs + coords[1].abs }
    end
  end

  extend self

  def run_3_1
    AdventOfCode::Manhatten.new(File.read("#{__DIR__}/input/3.txt")).closest_intersection
  end
end
