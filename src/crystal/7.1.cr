module AdventOfCode
  extend self

  def max_thrusters(program, phase_settings)
    phase_settings.each_permutation(reuse: true).max_of do |phases|
      phases.reduce(0) do |setting, phase|
        AdventOfCode::Intcode.new(program).run(phase, setting)[-1]
      end
    end
  end

  def run_7_1
    max_thrusters(File.read("#{__DIR__}/input/7.txt"), [0, 1, 2, 3, 4])
  end
end
