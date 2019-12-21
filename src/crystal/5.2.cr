module AdventOfCode
  class Intcode
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
      when 5
        if parameter(1, modes) == 0
          @instruction_pointer += 3
        else
          @instruction_pointer = parameter(2, modes)
        end
      when 6
        if parameter(1, modes) == 0
          @instruction_pointer = parameter(2, modes)
        else
          @instruction_pointer += 3
        end
      when 7
        state[state[instruction_pointer + 3]] = parameter(1, modes) < parameter(2, modes) ? 1 : 0
        @instruction_pointer += 4
      when 8
        state[state[instruction_pointer + 3]] = parameter(1, modes) == parameter(2, modes) ? 1 : 0
        @instruction_pointer += 4
      when 99
      else
        raise "Unknown opcode #{opcode}"
      end
      opcode
    end
  end

  extend self

  def run_5_2
    AdventOfCode::Intcode.new(File.read("#{__DIR__}/input/5.txt")).run(5)[-1]
  end
end
