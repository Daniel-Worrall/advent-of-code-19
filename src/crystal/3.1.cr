module AdventOfCode
  class WirePath
    property path : Set(Tuple(Int32, Int32)) = [{0, 0}].to_set
    property distance = {} of Tuple(Int32, Int32) => Int32

    def initialize(input)
      x_coord = 0
      y_coord = 0
      steps = 0
      input.split(",").each do |direction_distance|
        direction = direction_distance[0]
        distance = direction_distance[1..].to_i
        case direction
        when 'R'
          distance.times do |val|
            record_path({(x_coord + val), y_coord}, steps)
            steps += 1
          end
          x_coord += distance
        when 'L'
          distance.times do |val|
            record_path({(x_coord - val), y_coord}, steps)
            steps += 1
          end
          x_coord -= distance
        when 'U'
          distance.times do |val|
            record_path({x_coord, (y_coord + val)}, steps)
            steps += 1
          end
          y_coord += distance
        when 'D'
          distance.times do |val|
            record_path({x_coord, (y_coord - val)}, steps)
            steps += 1
          end
          y_coord -= distance
        else
          raise "Cannot parse #{direction} (#{direction_distance})"
        end
      end
      record_path({x_coord, y_coord}, steps)
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

    private def record_path(coords : Tuple(Int32, Int32), steps)
      path.add(coords)
      distance[coords] = steps unless distance[coords]?
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
