module AdventOfCode
  class Int64code
    property relative_base = 0
    property state = State.new
    property instruction_pointer = 0_i64
    property input = [] of Int64
    property output = [] of Int64

    def self.new(string : String)
      state = State.new(string.split(",").map(&.to_i64))
      new(state)
    end

    def initialize(@state)
    end

    def run
      while state[instruction_pointer] != 99
        step
      end
      self
    end

    def run(*input)
      @input = input.to_a
      while state[instruction_pointer] != 99
        step
      end
      output
    end

    # ameba:disable Metrics/CyclomaticComplexity
    def step
      instruction = state[instruction_pointer]
      modes = (instruction // 100).to_s.chars.map(&.to_i)
      case opcode = instruction % 100
      when 1
        state[writer_position(3, modes)] = parameter(1, modes) + parameter(2, modes)
        @instruction_pointer += 4
      when 2
        state[writer_position(3, modes)] = parameter(1, modes) * parameter(2, modes)
        @instruction_pointer += 4
      when 3
        state[writer_position(1, modes)] = input.shift
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
        state[writer_position(3, modes)] = parameter(1, modes) < parameter(2, modes) ? 1_i64 : 0_i64
        @instruction_pointer += 4
      when 8
        state[writer_position(3, modes)] = parameter(1, modes) == parameter(2, modes) ? 1_i64 : 0_i64
        @instruction_pointer += 4
      when 9
        @relative_base += parameter(1, modes)
        @instruction_pointer += 2
      else
        raise "Unknown opcode #{opcode}"
      end
      opcode
    end

    private def parameter(number, modes)
      par = case mode = modes[-number]?
            when nil, 0 then state[instruction_pointer + number]
            when 1      then instruction_pointer + number
            when 2      then state[instruction_pointer + number] + relative_base
            else
              raise "Unknown mode #{mode} for #{number} parameter"
            end
      state[par]
    end

    private def writer_position(number, modes)
      case mode = modes[-number]?
      when nil, 0 then state[instruction_pointer + number]
      when 2      then state[instruction_pointer + number] + relative_base
      else
        raise "Unknown mode #{mode} for #{number} writer"
      end
    end
  end

  class State
    property array = [] of Int64
    property hash = Hash(Int64, Int64).new(0)

    def initialize(@array : Array(Int64) = [] of Int64)
    end

    def []=(index : Int64, value : Int64)
      is_arr_index?(index) ? (array[index] = value) : (hash[index] = value)
    end

    def [](index : Int64)
      is_arr_index?(index) ? array[index] : hash[index]
    end

    def join(value)
      array.join(value)
    end

    private def is_arr_index?(index)
      raise "Index out of bounds #{index}" if index < 0
      index < array.size
    end
  end

  extend self

  def run_9_1
    AdventOfCode::Int64code.new(File.read("#{__DIR__}/input/9.txt")).run(1_i64)[-1]
  end

  def run_9_2
    AdventOfCode::Int64code.new(File.read("#{__DIR__}/input/9.txt")).run(2_i64)[-1]
  end
end
