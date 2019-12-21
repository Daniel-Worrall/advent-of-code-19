module AdventOfCode
  class Intcode
    property input = [] of Int32
    property output = [] of Int32

    def run(*input)
      @input = input.to_a
      counter = 0
      while state[instruction_pointer] != 99
        step
        counter += 1
        break if counter > 1000
      end
      output
    end

    def step
      instruction = state[instruction_pointer]
      modes = (instruction // 100).to_s.chars.map(&.to_i)
      case opcode = instruction % 100
      when 1
        state[state[instruction_pointer + 3]] = parameter(1, modes) + parameter(2, modes)
        @instruction_pointer += 4
      when 2
        state[state[instruction_pointer + 3]] = parameter(1, modes) * parameter(2, modes)
        @instruction_pointer += 4
      when 3
        state[state[instruction_pointer + 1]] = input.shift
        @instruction_pointer += 2
      when 4
        output << parameter(1, modes)
        @instruction_pointer += 2
      when 99
      else
        raise "Unknown opcode #{opcode}"
      end
      opcode
    end

    private def parameter(number, modes)
      state[modes[-number]? == 1 ? instruction_pointer + number : state[instruction_pointer + number]]
    end
  end

  extend self

  def run_5_1
    AdventOfCode::Intcode.new(File.read("#{__DIR__}/input/5.txt")).run(1)[-1]
  end
end
