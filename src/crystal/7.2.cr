module AdventOfCode
  extend self

  class Intcode
    getter? finished = false

    def next_output(input)
      @input << input
      while state[instruction_pointer] != 99
        step
        if state[instruction_pointer] == 4
          step
          return output[-1]
        end
      end
      @finished = true
      output[-1]
    end
  end

  def feedback_max_thrusters(program, phase_settings)
    phase_settings.each_permutation(reuse: true).max_of do |phases|
      amps = phases.map do |phase|
        machine = Intcode.new(program)
        machine.input << phase
        machine
      end

      input = 0
      until amps.all? &.finished?
        phases.size.times do |i|
          input = amps[i].next_output(input)
        end
      end
      input
    end
  end

  def run_7_2
    feedback_max_thrusters(File.read("#{__DIR__}/input/7.txt"), [5, 6, 7, 8, 9])
  end
end
