module AdventOfCode
  class Image
    def render
      String.build do |str|
        (width*height).times do |pixel|
          str << "\n" if pixel % width == 0
          str << case a = layers.skip_while(&.[pixel].== 2)[0][pixel]?
          when nil then " "
          when 0   then "\e[30m█\e[0m"
          when 1   then "\e[37m█\e[0m"
          else
            raise "Unknown pixel #{a}"
          end
        end
      end
    end
  end

  extend self

  def run_8_2
    AdventOfCode::Image.from_sif(25, 6, File.read("#{__DIR__}/input/8.txt")).render
  end
end
