module AdventOfCode
  extend self

  def nouns_and_verbs(string, range_one, range_two, expectation)
    range_one.each do |noun|
      range_two.each do |verb|
        program = AdventOfCode::Intcode.new(string)
        program.state[1] = noun
        program.state[2] = verb
        return 100 * noun + verb if program.run.state[0] == expectation
      end
    end
    false
  end

  def run_2_2
    nouns_and_verbs(File.read("#{__DIR__}/input/2.txt"), 0..99, 0..99, 19690720)
  end

  # TODO benchmark each_permutations
end
