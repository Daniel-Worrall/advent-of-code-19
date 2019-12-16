module AdventOfCode
  class Intcode
    property state = [] of Int32
    property instruction_pointer = 0

    def self.new(string : String)
      state = string.split(",").map(&.to_i)
      new(state)
    end

    def initialize(@state)
    end

    def run
      counter = 0
      while (opcode = state[instruction_pointer]) != 99
        step
        counter += 1
        break if counter > 1000
      end
      self
    end

    def step
      opcode = state[instruction_pointer]
      input_position_one = state[instruction_pointer + 1]
      input_position_two = state[instruction_pointer + 2]
      output_position = state[instruction_pointer + 3]
      case opcode
      when 1
        state[output_position] = state[input_position_one] + state[input_position_two]
        @instruction_pointer += 4
      when 2
        state[output_position] = state[input_position_one] * state[input_position_two]
        @instruction_pointer += 4
      when 99
      else
        raise "Unknown opcode #{opcode}"
      end
      opcode
    end
  end

  extend self
  def run_2_1
    intcode = AdventOfCode::Intcode.new(File.read("#{__DIR__}/input/2.txt"))
    intcode.state[1] = 12
    intcode.state[2] = 2
    intcode.run.state[0]
  end
end
